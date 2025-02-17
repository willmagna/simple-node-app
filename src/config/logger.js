import pino from "pino";

const transport = pino.transport({
  targets: [
    {
      target: "pino-pretty",
      level: process.env.NODE_ENV == "production" ? "info" : "debug",
      options: { translateTime: "UTC:yyyy-mm-dd HH:MM:ss" },
    },
    // {
    //   target: 'pino-mongodb',
    //   level: 'warn',
    //   options: {
    //     uri: process.env.MONGODB_URL,
    //     database: process.env.MONGODB_DATABASE,
    //     collection: 'backend-log',
    //     mongoOptions: {
    //       auth: {
    //         username: process.env.MONGODB_USERNAME,
    //         password: process.env.MONGODB_PASSWORD,
    //       },
    //     },
    //   },
    // },
  ],
});

export default pino(
  {
    level: "debug",
  },
  transport
);
