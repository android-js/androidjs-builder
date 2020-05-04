import {Interfaces} from '../Interfaces';



export class ReactApp implements Interfaces.IBuilderModule {
	constructor() {
		console.log("Loading React modules");
	}

	installModule(env: Interfaces.IEnv, context): number {
		console.log("Installing React modules");
		return 0;
	}
	create(): number {
		console.log("Creating React project");
		return 0;
	}

	build(): number {
		console.log("Building React project");
		return 0;
	}
}