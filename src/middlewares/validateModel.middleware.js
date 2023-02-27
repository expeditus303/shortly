export function validateModelBody(model) {
  return (req, res, next) => {
    const { error } = model.validate(req.body, { abortEarly: false });

    if (error) {
      const errors = error.details.map((detail) => detail.message);
      return res.status(422).send(errors);
    }
    next();
  };
}

// export function validateModelHeader(model) {
//   return (req, res, next) => {
//     const { error } = model.validate(req.headers.authorization, {abortEarly: false})

//     if (error) {
//       const errors = error.details.map((detail) => detail.message)
//       return res.status(422).send(errors)
//     }
//   }
// }
