Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.162.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795464447;
	b=nELWdxEcLu0u+iZ8lESzdzNdoqaVAbD08Yg8frxa4iakHvKHa/RGQLxY5u6zJa0VhQYO
	 /rrhXaCaS5DHqR0RRLYshf33eSBwDNkP/GRGGNSsy79HbsFoV3JrW/QZvW0h1ti/ODqQH
	 rzCbkIZy4SlA5/1scJMnwDMVo7QMo4Q1eXKirqcNVf/ntWY1dsQUX9xxMrJ+HdYv93wsl
	 cpyndB/mPPd8xii0Nz5UpBq2aBkMReKX6oP9IlWc+q61TWAUT5DoDCx1RLZBbEoh1grZ0
	 4gN7c6BManzn9R96N+t/C89AZTHHbaY/otlhhlJOuISJUHtUNHyShoUkkMC/1fHNalg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464447;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MqyYXbuH/ofM9vRlIVzRus7B/ekxp1yURx9uGa6Jvio=;
	b=OalKL2IPTw9/Qqgv2li6NMa/ilGP23fsw7bOCmyVukuU8o1QEuNqlEESI2RMqsMw/wYE
	 t44nlX7SPjFJhimoJHkAuIUxMe5T461JIKlBaswmjyGHOQ7a87bYFHAy6tfs3Z1GA3XGV
	 IWGMY4vTpm/D//inj0/cL8LeWDsq9uu5Oynb0zoiCBd9eFdnYzqdsfMu0ySwOncce7sTP
	 diwySprOz2w1RAnQEVm9a58lQRBi1HQaK6YkEy1AKE2WiqggXvDSsuIgUM11g6UVyJczx
	 jgVcHnOOwmmC3yqmXgPgengdlHYZSA1qUc1S/B8GmG2J9vykBJwQozu/bRBtAjbHx+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=omPmYpn8;
	arc=fail smtp.remote-ip=40.107.162.27
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C2606A31F;
	Mon, 23 Nov 2026 20:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9C2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=omPmYpn8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJUHCJBhK4MNhHVUNR6pH+I7QS34fGMJTxaA8NFgT3fPGgbF2Cv9p/UQ78R/O3gvn0c41tsHoHqrj5g+rY/lfCFY75YBPHKzNDK6enI6eIdq5JNQw3FxqHk4aBwxzupgLmftBUCY6JOo6vjlhllNzdFIRk0BfzEhN60cQKgnWZsv3SS8KQ7hdySY08TPG/98nmlpQ643Pen9i1QbJe9Exj6qHhjt7wHAhO4L044kDAvLyM//i2WbOpqttdUPyhiIAR+Rk+XyTNiDRlzwlgPmGIIrTI8/Ht1ghHZagXMRbHommuhZ+0om6iPgjNTac60VBJPrCj1K5kps/O5dxoXgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFy64R+U+xuO6fEixupzO0DYAmCVwREGfGkRZCS+SGk=;
 b=JqwJm8XINdPpTn0M+X+OQBPKCKmev5kj/f+OO3WJ8IpeHfeQR/z/GLr5tbIgRhkcQtl3h2cG+c5rR2/qQ86nZ+VMi3dRO/bdXCgzQv/hAcMeMYxUQcCi+Ek4Mxi5O4TgLMoRT4nSJFKZiTlzM0Che0BUxpIXl9uRt+/75qh9/DDSGOzpsZvVN+UcpZnQ6q7E/y9ajD6sP7hdNwZjI+NAxHhKX4GVmXBRk4+I9WchSOyhtPOtAagOr13ne6JQtoUDvJ/FYGBNyjp1Zec8Xy9bJy+4DLwkNOnsccNVdiNuv1Q2FWhq1K4HDQ+9ZHZ7HkKStRT5lE2WeYRwzgysZjOCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFy64R+U+xuO6fEixupzO0DYAmCVwREGfGkRZCS+SGk=;
 b=omPmYpn8yA5l6CnsruvtD5TjlY/EAjyr3nNeBywRqck32vtkXWdnDbELskc//SmbUUQDoDwfPf75Qu10ZQUuXy6sGYnj+oRXZj1JEaxKd/aRD2Vt8uRPJMDewNPEE2dTIPNFgjSwGeJNhiO3u2A0+SmwV2vbZlyr3EzAbRRxB+/xyq/l1m9cR+amoaaS6NaYqntwO41JY9ih1LJlVwnrBLLVx6ST1S7f5Um0SP8+DjfLqm4yyhp2foY/sQtJSNqg67QA8ML+EHcxVFDg+684jG+79iH6zV7CDvJyzrFAgVCxNLysc1mSNkY6H3vLm4jAQJK+csl+yf+OP0XLLQrHzw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB7910.eurprd04.prod.outlook.com (2603:10a6:20b:288::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:07:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:07:23 +0000
Date: Mon, 23 Nov 2026 15:07:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, lee@kernel.org
Subject: Re: [PATCH v22 1/5] i3c: hub: Mark downstream DT addresses as
 desired on parent bus
Message-ID: <awSc9Pek9c3jLO8N@lizhi-Precision-Tower-5810>
References: <20261119095449.555593-1-lakshay.piplani@nxp.com>
 <20261119095449.555593-2-lakshay.piplani@nxp.com>
 <sashiko-outbox-222922@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-222922@kernel.org>
X-ClientProxiedBy: PH0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f724569-667a-4d1d-5165-08df499d6341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|19092799006|10067099003|4143699003|11063799006|56012099006|261022075727099003|261009223027099003|261009221227099003|261022105027099003|261102130727099003|261028144727099003|261026121527099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2Sh8GEr/3EwoeZkhwArvigPKkKj9PjyNPDG3dQ1B5Kg8SqSDnD3/47+21ZZ8y3xbA65KMbHDEAu7C8l8ZUE1K0iyeL+bZzO9T+61eoNQToDPv7rga/ZuqbQxX0KDHVkTAviRIgcJf+kD/Unz0NmvvhmsHLq7jvsmSONg4f36EjZBeySA82Chyu01jwKmrZ+1frezcZSa1Y4+Vz5baf1QfnbsDKk6PO7ZxwIZY5q0+RhwGPNzMYN7/bStxMPktNq/oZXi0Jcuk7JHaSPP5GRiZ1/L5HfdvM59nVOX3w82Te3m4IG81h9s83cBAhub28Jep9T5LoSI3VcFIuxW9e6CevTr2oSvPBSpQgDBJAOGg7wIEb7NwuR0k7s+bA05jGkqb3isRKdFX7HRPJMrlP7yzt/gHizMMXdhvFdb9Ay5EcsK3JNbGoo/micrKtfhUma9YlNYn6FEJxWuvbqN2xnpgPKjyDRwFCnrOoD2YRBKL5sbzSErsihJ5SWqNZvxaY74hyK2f01Pw5f+QKQOuRbS3HiAUytsGCIStESGyuchBeNmRjD1jmVRBK49TglIG5a1uc3KdARW+m65/svqq5CVp5AFUr9sy6b5wSBE+z45hIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261009223027099003)(261009221227099003)(261022105027099003)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?SBQRWFih74FBbwhdFropXA67YKx8ghg4IXdf8330eWHIao+uTHJb8zzSuD?=
 =?iso-8859-1?Q?bGQJk1h352RDXMOO+3g73/e2m/cG2GrXXsYnrPEkMoOzEL+Xw8QPOozuXR?=
 =?iso-8859-1?Q?U7dxtM8GzZz345Egzc0k772+ZK/gOl4sB/qhQ98vVT2eLC0YtszgkrIlxo?=
 =?iso-8859-1?Q?DV6LUBtOzOf30LVPb9P6JQ/uaO2vE6skh+eU8lNkxkMoJu4BB+SPHjmmb6?=
 =?iso-8859-1?Q?Qoeu/F1Cl8pmWZLh15hrnwoc90Pi4Om7ljfA6rLWoOzNsCT8yBP4xr6jzH?=
 =?iso-8859-1?Q?fFQuSAhRjddP2yTI1dE+F4+cblYxV3ojUpq0ZSGAHgpajaLuwGslLNjVtg?=
 =?iso-8859-1?Q?rYT4bmQTh1Wr4RA0kb68a706F78pU3iffl9iOS7dqsCdvxFNll3RghH5+O?=
 =?iso-8859-1?Q?qjHfL2ewNlYABSNJwFy7RTCIMvQXCzLjBFkj88dwLAhvoToodzXYGmAOB0?=
 =?iso-8859-1?Q?LqYgBctjMXBAnsTHIu+X8B7x+6FWBHgRznw8A2O4UREYFliu/KQADRR1up?=
 =?iso-8859-1?Q?xAwNw+0FlD4i1AK7mpqDj4cYDXSeAiN9XgwKQmhxh/5GSgS/lMnAS7R0H2?=
 =?iso-8859-1?Q?GyMsyxDKOzrZQTP6q0lZtgAjwEI9oTF0hYhbAsKSnbfUSdRJdQEa2wFc26?=
 =?iso-8859-1?Q?I6Vc8S6QbSmCHDmSpiEPc2mGuu8oIJE234zUsJsT3/3eE13KFX/5iyGkQS?=
 =?iso-8859-1?Q?Z0bjrtDTGGJTcMj1ZqFnBPK4N8tKsAPjFvRab6pRu80MFk/owoo3ojjSL0?=
 =?iso-8859-1?Q?tebn8R2CK2LndAV3jTBlAgi2YtaPYxAZ+cK4F31ybvjt5Nr1jqin9exWqp?=
 =?iso-8859-1?Q?jFM2Ev+D8A5TcKnVGEVUtIke/qCcRc8YwgqrA+Yo38XpnMUBnjkJSdCB7R?=
 =?iso-8859-1?Q?YJIfEf3LOdw+TYrKN0ctvSliDCYzU6uEwVTjlOlkMnYkTIgyhn8q6sN8zX?=
 =?iso-8859-1?Q?JBTKRDWVF0Q6igx52AaLF9/StSZI0EPfvYLds3cinC/C6zNgI20a/y8zrA?=
 =?iso-8859-1?Q?Sk7Gv7HRHjPhLAJx/WZ8g1dDLbjoxLFfDSnNwZVGUll46cMy0QWyQuVJNT?=
 =?iso-8859-1?Q?AF6lNy2HV/xdK1juX8UqWRc5Xx0itqrb/u9FwtlQ8LtYayaUlJrVHvHLMF?=
 =?iso-8859-1?Q?2Za2oCV9EZHwgUQpJBGRMOb3x+3KDvE5EYGywqy+RQujN6KQiFgwJnTrFn?=
 =?iso-8859-1?Q?s6UHRZ32r/ns+gHDCnx+H17xYpvWZFsVNxRCrlxze/2Yw5dnO3Av5ZM9Hc?=
 =?iso-8859-1?Q?n0+QKOC84+s4nijmxbFR2oPyemPQOMNX2MUnCmy7E1w5dayCEXBjZgvKcJ?=
 =?iso-8859-1?Q?uLefPVnMgabEnEakOs6DdGOF050vYy1PHQvOxehjW57peKaDnMQ+0THzsI?=
 =?iso-8859-1?Q?QKQen8PwCz/yl2KI4A/xUSh0ANNiAB9ldFt4yx7fRqTDFjS6jZX6yscTYG?=
 =?iso-8859-1?Q?/7iMTlrX1b+PMI7kwZyxbfN/668XmSdkwIIHrVWyd3rbUdBcUjUMloInxS?=
 =?iso-8859-1?Q?p0xOs+SHCV94PZrjIQR1z51peZZttxOU1nYjqybdQOJ1IzYrkNnGCLZqwM?=
 =?iso-8859-1?Q?RbgWHMIzDt3KaNA/gk4ozmIzOoAAj3UddZf+ceq4PsWC591GrTeLMU2vai?=
 =?iso-8859-1?Q?vIsmfUhrm5m1neWQEXGMAL5RKPpOaIgYMC/zpfc/PlIu1RkcQ58TSutN+e?=
 =?iso-8859-1?Q?J7zXXTMDALv6ckmkGTse3DN+/vCAOFWnxtajoW1SEXDHwHwjqr5IWxXFKS?=
 =?iso-8859-1?Q?JRuYKA7q3yNMLGjy74finorY4QuLEH5w9LlaBJ8q7yZHkBbtElymE6ojtq?=
 =?iso-8859-1?Q?lynQR/UFmaimbcs4cstQSRg5t6tRxLPxeJY/xJ1epyBQvBsnE2Fh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f724569-667a-4d1d-5165-08df499d6341
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 20:07:23.4639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3J5tNU7SBD4TJBtPyFeRuVT1iWB2ovq32WL/1Vm9x6co32tdL0HtFM9n3KU5t+C7gxJG4gRDtP9QpTgQUuiw2t7Su2MW6tl4E5AOKyW25Wa58g7tE7+lW14S5v8+EwL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7910

On Thu, Nov 19, 2026 at 10:12:03AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] i3c: hub: attached downstream devices leave parent slot free
> - [Medium] i3c: hub: downstream ENTDAA devices miss boardinfo for
>   SETNEWDA
> - [Low] i3c: hub: missing Fixes trailer for commit b0cfe49a2e3b
> --
>
> commit 8029b535e0098c5324d297a089353d72c193eebe
> Author: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> > i3c: hub: Mark downstream DT addresses as desired on parent bus
> >
> > I3C devices behind hub target ports share the parent controller's
> > dynamic address space. Their assigned dynamic addresses from Device
> > Tree must be preserved so that parent DAA does not allocate the same
> > addresses to other devices.
> >
> > Previously, the hub reserved these addresses by marking the parent
> > bus slots as I3C_ADDR_SLOT_I3C_DEV, even though the downstream devices
> > were not attached to the parent bus. This could cause address
> > reconciliation to incorrectly treat these slots as occupied by
> > orphaned I3C devices.
> >
> > Introduce i3c_bus_set_addr_slot_desired() to mark an address as
> > desired without changing its current slot status.
> >
> > Use this helper when processing downstream I3C devices described in
> > Device Tree. This allows parent DAA to avoid the desired addresses
> > while keeping the slots free until the corresponding devices are
> > actually attached.
> >
> > Keep the desired address markings for the lifetime of the parent bus,
> > as they represent the fixed Device Tree topology.
> >
> > Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> [Severity: Low]
> This fixes the parent-bus slot reservation in
> i3c_hub_reserve_parent_addrslots_from_dt().  Should this include:
>
>   Fixes: b0cfe49a2e3b ("i3c: hub: Add support for the I3C interface in the I3C hub")
>
> > diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> > index 5390287680844..95eec5b0cada0 100644
> > --- a/drivers/i3c/hub.c
> > +++ b/drivers/i3c/hub.c
> > @@ -763,10 +763,15 @@ EXPORT_SYMBOL_GPL(i3c_hub_init);
> >   * @hubc: I3C hub controller for a target-port virtual bus.
> >   * @node: Target-port bus Device Tree node.
> >   *
> > - * Reserve parent bus address slots for the assigned dynamic address of each
> > - * downstream I3C device described in the Device Tree, so that parent DAA does
> > - * not hand the same address to another device. Downstream devices behind hub
> > - * target ports share the parent controller's dynamic address space.
> > + * Mark the assigned dynamic address of each downstream I3C device described in
> > + * the Device Tree as desired on the parent bus, so that parent DAA avoids
> > + * handing the same address to another device while it is still free.
> > + * Downstream devices behind hub target ports share the parent controller's
> > + * dynamic address space.
> > + *
> > + * A desired address is only a preference: the slot stays free, so the parent
> > + * does not report it as occupied and address reconciliation does not mistake
> > + * it for an orphaned device that has to be probed.
> >   *
> >   * The reservations describe a fixed Device Tree topology and are kept for the
> >   * lifetime of the parent bus; they are not released when a target port is
> > @@ -816,9 +821,8 @@ int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *hubc,
> >  		status = i3c_bus_get_addr_slot_status(&parent->bus,
> >  						      assigned_addr);
> >  		if (status == I3C_ADDR_SLOT_FREE)
> > -			i3c_bus_set_addr_slot_status(&parent->bus,
> > -						     assigned_addr,
> > -						     I3C_ADDR_SLOT_I3C_DEV);
> > +			i3c_bus_set_addr_slot_desired(&parent->bus,
> > +						      assigned_addr);
> >  		i3c_bus_maintenance_unlock(&parent->bus);
> >  	}
> >  	return 0;
>
> [Severity: Medium]
> Does assigned_addr ever get marked as I3C_ADDR_SLOT_I3C_DEV on parent->bus
> when a downstream device is attached via SETDASA or SETAASA?
>
> i3c_bus_set_addr_slot_desired() only sets I3C_ADDR_SLOT_EXT_DESIRED and
> leaves the slot status bits on parent->bus as I3C_ADDR_SLOT_FREE.  When
> the virtual hub controller initializes a downstream device that has a
> static address and assigned-address, i3c_master_attach_i3c_dev() and
> i3c_master_reattach_i3c_dev_locked() only update the virtual bus
> (hubc->controller.bus), while i3c_hub_attach_i3c_dev() and
> i3c_hub_reattach_i3c_dev() call the controller-only helpers on parent
> without updating parent->bus.addrslots.

Is it fixed if update parent->bus.addrslots at i3c_hub_reattach_i3c_dev()

Frank

>
> Because the device already received its dynamic address, it does not
> participate in ENTDAA during i3c_hub_do_daa().  Its slot status on
> parent->bus remains I3C_ADDR_SLOT_FREE even while the device is actively
> using assigned_addr on the shared physical bus, allowing the fallback loop
> in i3c_bus_get_free_addr(&parent->bus, ...) or other
> i3c_bus_get_addr_slot_status(&parent->bus, ...) checks to hand the in-use
> address to another device.
>
> [Severity: Medium]
> Can a downstream device with assigned-address that is discovered through
> ENTDAA ever receive its desired address?
>
> Marking assigned_addr with I3C_ADDR_SLOT_EXT_DESIRED causes
> i3c_bus_get_free_addr(&parent->bus, ...) to skip assigned_addr during
> ENTDAA and hand out a temporary dynamic address, relying on
> __i3c_master_add_i3c_dev_locked() to look up
> newdev->boardinfo->init_dyn_addr and switch the device to its desired
> address via SETNEWDA.
>
> However, i3c_hub_do_daa() calls i3c_master_do_daa(parent), so
> __i3c_master_add_i3c_dev_locked() runs with master set to parent and
> i3c_master_attach_boardinfo() only searches parent->boardinfo.i3c:
>
> drivers/i3c/master.c:i3c_master_attach_boardinfo() {
> 	struct i3c_master_controller *master = i3cdev->common.master;
> 	struct i3c_dev_boardinfo *i3cboardinfo;
>
> 	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> 	...
> }
>
> Because fwnode_populate_i3c_bus() populated the downstream boardinfo entries
> on hubc->controller.boardinfo.i3c rather than parent->boardinfo.i3c,
> newdev->boardinfo is never found, SETNEWDA is not issued, and the device is
> left at the temporary address without its DT boardinfo attached.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261119095449.555593-1-lakshay.piplani@nxp.com?part=1
