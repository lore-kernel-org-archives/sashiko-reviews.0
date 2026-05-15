Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013023.outbound.protection.outlook.com [52.101.72.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6173B5850;
	Fri, 15 May 2026 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855731; cv=fail; b=OSrl79Jnj8p8L4abZgCVWpHhNO6/K23J22ji7/aRS9ZaC16bYsxhDtOHuso9k8Zay8+VWceal0RvwyjZdRaDqwgrFzJDZo9g72bniQ1sa+Mr10lszxeHNhsKjRrNa4w9hYkVvSzB7KbYmGiv4dI4U4pklxWSkNcraXK/VGq57X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855731; c=relaxed/simple;
	bh=HjvX65GSer+BBC/6rubPEVfspecCj3oFj7UIT28rA6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nyqO19rjCozqBedswtXoV7N8UOvg/IPFXYqikOu62hDLUdANY3H7qID/O9tYyqNug0h5UDQa/niej+ZQO/SXgB2fucri9C7+rfRzHEjZCF0ulJY+b0ubVOarCyDoY13yIPCWJibHhenLMcIRMIscPenvP5XLtdhmjrT+dgGnN7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WVmokrcb reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WVmokrcb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+VOoqK7tvBCnFL4mW9n/vNmJj1+UY0XmDmUtMT8ovuaXviBvi6t9j+QrXIQEz3p8FNLxyrQgsLn6t5tBxHK9TBheyqV+z0eVIqak8wFwuNZZi+1JNzwZgpg05ZtAOGHc9wdpjdU3B4a+xhS0NCc0sH+1++7bdVXk8IJXI0Gjtvd6OAf5nbUpIGBtpo0Wj3nvm+YUy0TXira/p00nE1LM2pkG0egSjP7dhWaFauI4M9/MLgUePZUps0T3OkQOQ6s+9n0QN+uNihJV0q93AuNuE8gxPizWBlAxaNBsBoroNJmaqq/SxlLVvd8AiiQ+nqi1jQxFUKiw9CfilOu/cFYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeAINXacJh37H+mSyVBCY8ws9epvKTUxUWweUqJXiAw=;
 b=N4WHwrZx/Vr68RpSWapjolpbMJLz+YN/BHTD+/s+bO2LS8pAN7Hf0b0QGUqCz586DmG1VrDyGrdoPl5GYGHv8DnDllxfJSj8KfOajCJgfFEjoV3nj7PncNmqIOVqi4J7eTSCakn+dCNEo7wH1NWMGsUAA4X0r94ciSG2E7SsOWhpjwU3c7Fe4glC3f395PwXwGjPxPb9AdIDR4rvsuYeVM1aA2zGtQ/a2r/bPEfqqWl2d7Z64S9OjefL0ADOogUd2PBUwePpc8Atyssu9TMuN17za9Xe31pgNaQ2Uj4PP62oIIqaqNLTqU9fbGjpQgixpq+azMXji8hVVQCEIW0JAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeAINXacJh37H+mSyVBCY8ws9epvKTUxUWweUqJXiAw=;
 b=WVmokrcb02CP8HzMCZ7K5Oh6m7VIPEwnexzOw53yjojO4AKheEPbJ983hFONa9eAR1VJoeMU0XxoqIBOjfWKMtJoY5Ey43rUcRklGOms8CpTFIRaA2mbu/JgCZhRMkrkOlomFH06PSyKRwvnJQLCS/NHLYavbd2yRVGegXJsw+8CVDVGIRIDx5AULLeYsxY5OZPbiozcuQAXU3D1iLYQVima/z3+pgPYzS2qJk+W7vY2+nzjQXA9rnhE3Tw4xYcTiXrtZaB+inBBYoC5OPKudOm02OmRN66jEsrKXsC9aDHg93Fe8/InOSF4lWwvItgKlFX/KxHM7K4TXW3M1eo6vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11959.eurprd04.prod.outlook.com (2603:10a6:150:2f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 14:35:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 14:35:20 +0000
Date: Fri, 15 May 2026 10:35:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, imx@lists.linux.dev,
	Frank.Li@kernel.org
Subject: Re: [PATCH -next] firmware: imx: se_ctrl: fix init_device_context()
 error path
Message-ID: <agcvIVe0y_B4tOlu@lizhi-Precision-Tower-5810>
References: <20260514090457.2186933-1-pankaj.gupta@nxp.com>
 <20260514175132.EEF00C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514175132.EEF00C2BCB3@smtp.kernel.org>
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11959:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eeb1da3-3b48-4649-fb99-08deb28f3097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014|4143699003|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	XplKbaIf3R9pXYwKrhTJ5uinjiPEE+ma6oKPwy6LDdfOpQqSU437GlUJBU0SzQX3pLZvYnFF+i8vWyWeOia1AIaDQIZZ38YXfgl6yM+mS8tJps5gKxxVzDR+URbvXgOTbk/HV3YWxXV3B9o0Nr37HAC8ZysW5fP5AEuxaL18AQlaqCUSonG4sP6wDg6BujXzs8BcfIkxEQsiYKKJda6avxxfnpawZAhkXjat78FY3hl29w8GfK0AfHOPDxMAggnFrWCm/62sAGpIOoA3CGLjbnd0f3DoLnYqHl0LlCjhTIQppCPvlda1cbdwOgltgp3jBCFYmru1+Za1KfwnYCPq78X/UgvJ9SitKv+OtjaC0bCAAIUJYwakye/5hfW8cgIzk+AMp3pCajl+Q6DxkbkAz7kzUazHdpqkIO4kp8dEpuvF2jrwsQ7bO59GIEST5js5R5knJXhEMFQM/h/G4BEzBapa3PnnzVwlrBxvJRmn9E6Rzr1yZ7dHFpaZ0CHK1E8kZ4B4/dl6Fv5I+TLVhHHBlDXr3arzKE9O2yPqsR8fd4ebZtWWqMQjstGlYC8m+hSzX3BMXuSXHZGNfnUz/KyJN/DxiVpk282xqXztym6RJyCmWKc/6CJli5ickF799W0kMQkP0LOXXMYtmWmr5xT/QGUnpuHyAkXA+OATknc/AC2QoTK2ZVjnNiyb94bSSXtj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014)(4143699003)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zML2JtFHeYsdfuFYVngetLYwoiBxFF+/ZyZfoOok7r5bAswcvMNELSNItm?=
 =?iso-8859-1?Q?TrjYPeKIdBp/xsSfx2xCg9FQsvIacQlntB+Hl8Fv+OJZ0O3zpspcuSSY/O?=
 =?iso-8859-1?Q?XENNHZGEXdgq5I0La9NqfmGcrGW8PJBrkUQMedM0SEyRO7I6KeqLVVWLYL?=
 =?iso-8859-1?Q?L6Znc4fv8eVAe0WuhHErtR2a9eNRJu4lFhUrdkX4+uJGZhPmDOYNJ6kNHz?=
 =?iso-8859-1?Q?bGjGkw3e+nBLSEfOo6GIoFTGwhNv4eBC8476iN3TYtnuvNX3gfhZxyGgkq?=
 =?iso-8859-1?Q?LmryucvHSVJHwZOttdrAx5HXgXabk1tgpIl7GMvTLbQSVA1hKapZS0ObpJ?=
 =?iso-8859-1?Q?fiSm4Kiu9CZl+Pyq34z3JRbiA1NeB26PKFnWlVbR/Vjk8W4AbZnZZVc49E?=
 =?iso-8859-1?Q?cDxAcfdqdrGheoH7ovj2BDromb9Q4Ic/UN38smPNHStbcrHIq7SkcNxiIc?=
 =?iso-8859-1?Q?kr9XdjVke+xkh3P5jzbr2E7Q6B9lKEmBqT9KBfXDGh5xQm09EarEiJQYwO?=
 =?iso-8859-1?Q?6SeVUnrDv2joQxy6KM0F9WnHhetcecb/Eura6wFrYl+CUJ2HOjQRa7J6Xe?=
 =?iso-8859-1?Q?IWZYrrySmoiaVq5gD9V0YHXorvuBDKWA/KKUmbHssvnQmlFk8fEfcxmqVa?=
 =?iso-8859-1?Q?16DnTmbipKmuLwFdTXQGvic2q/pwhtB/f31tRqfOUzzxfgjQezku+R14NN?=
 =?iso-8859-1?Q?XJ/Kc7T+AGunXeC7/7r+WVv93Eq4YKizliOKRbDVqiSduS92q94W4klZmU?=
 =?iso-8859-1?Q?KSFKm/0kOPRnzC/gumdxEAn93+41I+u9KvfUXsy2KYwvKuhhWFE+Jw3ZEr?=
 =?iso-8859-1?Q?fO3OwCd5V7bOXb7QeLyiZX4auwDt+18dlQoSjpGQ5IVP5qxJo59uE8beCK?=
 =?iso-8859-1?Q?B260c7/i/KAdWzabv4oVY4QPd0bloKs3di2iKUkKEmKs7bsKFyzYZ4VUC1?=
 =?iso-8859-1?Q?2e/bkWtryDabvEQ9Cutohg4s11P0N3Y5BWQJwSN7mSlff/I0T9FwKHQVJ+?=
 =?iso-8859-1?Q?yxOOsw5pR/Gjz0F+1uL24WsRbCqlEuQBUIrLU3J9Pn3VjMNlfHKxR3Trwf?=
 =?iso-8859-1?Q?kpLGHmOy5bO9YB2PCiWcl3QTr8Ar/WFcm/9L1egAeW9EN1UGVPKuqw97qI?=
 =?iso-8859-1?Q?OXNy686a/EjKKC4WniPkr4xZb3NX372mSYC7sqLgjLgMBo46DkTG703tv0?=
 =?iso-8859-1?Q?blIYWYfqKe6D2JDRuIqUyJ/HrbncWU2J7WW95BjDmR+SjBktjFBD/zamkA?=
 =?iso-8859-1?Q?n4oToRfh2pFe2xo4Gut6LlQxPCEhyyKeVj92PvXNWpOygq0WaojD0KFsBj?=
 =?iso-8859-1?Q?kaoxIcg8+4Xn9Kze/Cwm7OAf5k+pXFjPxbFtTDkyitXGxe1MttFE1xJyuH?=
 =?iso-8859-1?Q?YGYe9ss7GQdOr0T5nIkef3ADcd2h7Dqr07xASumNEn0Rs874FGWHm47ukw?=
 =?iso-8859-1?Q?ttyEYg/eUPtA029kK49QnqgMZmXpbGhcmROFUTkhfMPwXPh5eAuV+KZV2t?=
 =?iso-8859-1?Q?BtC9aD/lzGUBehvCozQl4ldBasqHSwg7nDyErl5MEan04iIJvihmRO4AQF?=
 =?iso-8859-1?Q?SrLHPAnqyh2PJrtihKKRp7j7zmUSMba9ChDiG+ehW3A1uzb8LMDdWnn3yG?=
 =?iso-8859-1?Q?nbPCV5uKa13l2lnjUHvcmkYaSTmvYRiQIHCXVlJ47nZJ8KCuTNaasV2GqB?=
 =?iso-8859-1?Q?+mKq2NfQhjAsmOOxAUnweBR+Bu8Dm3YVbcRh5xHS3VGgbSzuPgblUo5ndw?=
 =?iso-8859-1?Q?eanhUUxZN7KC6wJdOTwaP+xQ63n/odojVcDa253vLrZDgM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eeb1da3-3b48-4649-fb99-08deb28f3097
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 14:35:20.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0Bvz0KZJNqoYraO3ko/jY0v8+PMXBB56uMJlW9jna/SWVvvOFbivW9qKY5D/d3F8iY3DNACL8NrH6BDVnzvZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11959

On Thu, May 14, 2026 at 05:51:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Use-After-Free of `dev_ctx` during implicit `mutex_unlock` in `se_if_fops_close()`.
> - [High] Data race and list corruption on `priv->dev_ctx_list` due to mismatched locks.
> - [High] Permanent resource leak and Denial of Service (DoS) in `.release` handler due to interruptible locking.
> - [High] Double free, list poisoning, and Use-After-Free vulnerabilities during driver unbind.
> - [High] Use-After-Free of asynchronous mailbox messages in `se_if_fops_write()`.
> - [High] Data race and memory leak in `se_ioctl()` `SE_IOCTL_ENABLE_CMD_RCV` command.
> --
>
...
>
> drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
>     ...
> 	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
>         ...
> 		list_del(&dev_ctx->link);
>         ...
> }
>
> If multiple files are closed concurrently, or an open and close happen at the
> same time, couldn't this corrupt the doubly linked list?
>
> > +	priv->active_devctx_count++;
> > +
> >  	return ret;
> >  }
>
> This isn't a bug in the diff, but is there a use-after-free in
> se_if_fops_close()?
>
> drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
>     ...
> 	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
>         ...
> 		kfree(dev_ctx->devname);
> 		kfree(dev_ctx);
> 	}
>     ...
> }
>
> Because scoped_cond_guard automatically calls mutex_unlock(&dev_ctx->fops_lock)
> when the scope block terminates, won't it unlock the mutex after
> kfree(dev_ctx) has already freed the memory containing the lock?

Looks like it makes sense. you can't free dev_ctx in this guard. Please
double check other AI review result.

Frank

>
>
> This isn't a bug in the diff, but does the interruptible lock cause a
> permanent memory leak and potential denial of service when closing the file?
>
> drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
>     ...
> 	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
>         ...
> 		kfree(dev_ctx);
> 	}
>
> 	return 0;
> }
>
> If the calling process has a pending signal, the lock acquisition fails and
> returns -EBUSY, skipping the kfree and DMA cleanup. Since the VFS ignores
> the return value of the release handler and destroys the file unconditionally,
> does this permanently leak dev_ctx and its DMA memory, allowing an attacker
> to exhaust system memory by repeatedly opening and forcefully closing the
> device?
>
>
> This isn't a bug in the diff, but could driver unbind cause a double free
> or list poisoning?
>
> During driver unbind, devres automatically frees the priv structure.
> Then se_if_probe_cleanup() iterates over the list:
>
> drivers/firmware/imx/se_ctrl.c:se_if_probe_cleanup() {
>     ...
> 	if (priv->dev_ctx_mono_count) {
> 		list_for_each_entry_safe(dev_ctx, t_dev_ctx, &priv->dev_ctx_list, link) {
> 			list_del(&dev_ctx->link);
> 			priv->active_devctx_count--;
> 		}
> 	}
>     ...
> }
>
> Since it removes the links but doesn't free dev_ctx or revoke open file
> descriptors, if a userspace process later closes a surviving file descriptor,
> won't se_if_fops_close() call list_del(&dev_ctx->link) again on the removed
> node, and also dereference the already-freed dev_ctx->priv structure?
>
>
> This isn't a bug in the diff, but is there a use-after-free for asynchronous
> mailbox messages?
>
> In se_if_fops_write(), tx_msg is allocated and queued:
>
> drivers/firmware/imx/se_ctrl.c:se_if_fops_write() {
>     ...
> 		struct se_api_msg *tx_msg __free(kfree) = memdup_user(buf, size);
> 		if (IS_ERR(tx_msg))
> 			return PTR_ERR(tx_msg);
>         ...
> 		err = ele_msg_send(dev_ctx, tx_msg, size);
>
> 		return err;
> 	}
> }
>
> The mailbox channel is non-blocking (priv->se_mb_cl.tx_block = false), so
> the framework can queue the message pointer asynchronously. Because tx_msg
> uses the __free(kfree) attribute, it is immediately freed upon returning.
> When the mailbox controller processes the queue later, won't it read from
> the freed memory?
>
>
> This isn't a bug in the diff, but does SE_IOCTL_ENABLE_CMD_RCV have a data
> race?
>
> The command modifies the global driver state:
>
> drivers/firmware/imx/se_ctrl.c:se_ioctl() {
>     ...
> 	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> 		switch (cmd) {
> 		case SE_IOCTL_ENABLE_CMD_RCV:
> 			if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
> 				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
> 					priv->cmd_receiver_clbk_hdl.rx_msg =
> 						kzalloc(MAX_NVM_MSG_LEN,
> 							GFP_KERNEL);
>         ...
> 				priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
>     ...
> }
>
> Since this section is only protected by the per-file lock dev_ctx->fops_lock,
> if two processes invoke this ioctl concurrently, they hold different locks.
> Can they both bypass the !priv->cmd_receiver_clbk_hdl.dev_ctx check, leading
> to concurrent kzalloc allocations that overwrite the shared pointer and leak
> memory?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260514090457.2186933-1-pankaj.gupta@nxp.com?part=1
