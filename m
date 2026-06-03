Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD933E63BE;
	Wed,  3 Jun 2026 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504558; cv=fail; b=OJujTnVB8HutJJKaaqBvCi6UzqFD9IeQIcp9uNJiD60sOFukeTFxkqywfG8tLrzhFGwwrMNHD3RmJdW6i3Ize4KnZSgr7TvX8+x39g8zf7n+FWfcq0myyWL+rn2rS1b2Alf0gfC97nJcMy9Fj49VUhmpkT0HPZ0YhAPJ5C4mTmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504558; c=relaxed/simple;
	bh=/o7M6NKDmp96cU4EQLg4AyK3cKATbUDWgWd2mgkE74o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eMk+0vMbUbTTPYnqMcbCIBtmJMbFIj0Udjzc8Be3M5xQDDNofRmo06RY056VjC86Vq2AL8G3/8V47Nti7A7E9Vb4RY2N2bFAE+vFgSRDoO/YfZ62lFu6dQWbLp2RFtmua1lj1RRcoxDKULHvRc8KLAlYFi89b+/MPlgA7JqnPNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PPxy+0eh reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PPxy+0eh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHdzdQMay3bnDDYlIx9eYAdjMf6SC3EaPgE1V4l5zbUiCKoko3DiFit8aOGRCgLvW0vjLptf04kfwaI+iE1Io0RUI60lsiom0GIa20QylP3BM5hhMS6Wg73/5pVV2wY/89//bybrRFB+5TcQmQmsWFCqgvhQ4lWYA19ssSrbiQsHHcLROK6UMjbmqWRz5d/jt8EyKSl9PwguYqfcntgEl9EqTeGidNKJkAh4GUu8MViWCC3lS69U2fb0FPYiRqLCCtfGcVriGKsuGODmIjEhWuzI/mJAoywQ+/Lh63IjuwpF7baPqP1Mq2eCzSb8o9YoDNVgqYf0E3Jh5F35iALCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXC5Fq86Sh58je59qAisVGyBdogM6HIiHI5C4jo1EbU=;
 b=haaDzjZ4QxLBp3iM4kKso1GoBKE2yHHqg8v8TUF/FB5y5791hpURrnQllBEwJIOtinOsTbaxbJeRUpp2zbEyRIowa+Z9ExTp7YhQWywqIQeQHJCYMjKqzgYFO1i2AcLPx7y7C8cP4ey11yw24t5OfaHqp59kqTkG5iB2GMTH1xuQ/1oRACt22g0+6XVUx4NhAA3LWns4313/vB4LL0JIc6Fd0jiOPcGITk+Y174Ywmkc73Idnwpu1mwpug+qyN72bex5aD99zj+kzCKeKB2an84CqLoHRZNWGZi3lykb9hvKJn1Q6LFLZiu3JPwnIEHOk8FuPCcp0dOzQG7sA/9Vzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXC5Fq86Sh58je59qAisVGyBdogM6HIiHI5C4jo1EbU=;
 b=PPxy+0ehRnnfBDwJD0Io+qApminfnj0cVKsOq+HOi9DY2RpRIbCQWrNQnAk7sLZTEHlZQuJgOehbXtUms6+9DC2J1bUkxqRufWH/ITzZ0OcSGLgGIi2EX2Vp3pSZ7jRFDScG3fVrRMwdXXji2usoJEXqUmOchif2r1oA3LnUmqvzPKLbWZNAZlGVpXg+VWg2rdALgl4lliRs8YSYzuH0sNdoLAgnsH+LfwROnDlRP6ntS+JakH5Smg42kbgTsKMlJa8bhmcBiFO2zWSd3jvM6tn5gKEWw7C6/MqIceQyuzVbb/Bmtm1S+xwoab+aIQnV6B27rY3mpolg38rBeSQIdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVUPR04MB12194.eurprd04.prod.outlook.com (2603:10a6:150:33f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 16:35:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 16:35:53 +0000
Date: Wed, 3 Jun 2026 12:35:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, conor+dt@kernel.org,
	robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 02/14] arm64: dts: imx8mp-var-som-symphony: enable USB
 support
Message-ID: <aiBX4zz2y5vzX3wF@lizhi-Precision-Tower-5810>
References: <7d8b29b9a29b1976cafc3d279482012efae1a994.1780497188.git.stefano.r@variscite.com>
 <20260603145019.C62B11F00893@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603145019.C62B11F00893@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:806:d2::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVUPR04MB12194:EE_
X-MS-Office365-Filtering-Correlation-Id: facfdd88-cef5-4e07-06e3-08dec18e2dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|6133799003|4143699003|22082099003|18002099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	lTa9XUW2GsG1OawHJkE0RxX3GgOailGr9DM5jF0s0m/SqZOMqBdt9sQnp+PKzEml/cY+ewkVZHHt5Ll67YGC/bQ8dzKbtDhp5joHnNVnucNgSV7Cjb18XOCmPAuxWoNMQiD6SRReyIWVfLjX6YG/HewJEewl8W/fSQDbl6DM8kse/KcMFGhktTlEacMezeFkWwxrjNuAmhsFQlla4CPWlXjssl4L60eMwLAJCOX2o5syQjBxZytnXpTFU5rZUVTj3lQc8+AE+ZEY2tldtbf28sT/dO+gTwgV1UM0x2eZwocLszfSMIcDiz49Vv7FuLyLs/PoC2SFoPIPrg8gEIdTKz448RWTS1cpBUslRBEykO2IPqZcrvIf6zsY4VmLlLuc9sY22Nvac17XSCdMlajnph70p6TOupa7x/5r0slZdFQovjD60vg8zCzH97++pQuaz/9vowgoweWtz4NUSxufmBXxEE8FHuSc2L/3LgV1/yUTCyNk0iXYiHES7JI2aZiVP++C/SgmUtEbNsWtr8+LlEoSa7heExbXD45QKe5oMsuA/dpYh4HA9AhyLqgWZkA7N1zZuOA70hRWZfKukcwhvnbzTkftA2YHQc0I1+gaX0Bwx3zkm+9stdbzLWUJFf7i2Bsu7Tj5x2gCTnKP0Q4IOLH/sRoo0on5Vp4QyExqLmMKQnnI1p9XTMndEMJ6HP2s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(6133799003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?4O0U/eNIBpNiMr1vv/l1BAgezjmWD/wbYiKvjGeXV+G+YtoszfcxA0OUf4?=
 =?iso-8859-1?Q?DWEu7lf92XAlo8p1BOy6pEgHSlYaaMQXvX/48cX4CuQeVzHTLLcJ5ZgOr9?=
 =?iso-8859-1?Q?gAwvjVdGd/HSWXPKIT+2D2IAiBwm0ubCDkkYpsAAfADhAlEZkK8K9T93P4?=
 =?iso-8859-1?Q?NW8mM+LJRHizC2y+7QRUCguS0JmTH1PT1XFB5dIrWSJplMgRFvuqGCVBja?=
 =?iso-8859-1?Q?vFEJmKf5b3Fmyffz8QLjkF0KXWShWEFM+ODmuHQj+IuyvBPNAzcWnBc3jq?=
 =?iso-8859-1?Q?S0sbcLq7AaFD7uPXWqZWM1VJYTpsLTD1DPrWCyW+6r15RDiJzQ2h0+GIel?=
 =?iso-8859-1?Q?p1FF9u+8vBLGdqRQSQCuQClnH+GHylm+aQceo8uhuD+pI7v3/1xz5qhznN?=
 =?iso-8859-1?Q?otUuKnls6a/9B4ejsihzvQfEMLnLBExTrMyfly2l8h59SpscTkepoSV/pb?=
 =?iso-8859-1?Q?07RxHeivIv41tR8Az1SNz/7XIifbzGlDhGrDz9p+nu0+pfujPe71RdXkx/?=
 =?iso-8859-1?Q?NAweAPsG0riZWGJrnCMzAP5Ps5I+YNm+ydxu/fYQzUNIcpOfu27b/l4RA5?=
 =?iso-8859-1?Q?2PAs82Y9pllPDuhnrCu+4xNsv/wfwotgAK96IF9TIjnOjnc8cF522tXLhS?=
 =?iso-8859-1?Q?QZ8Qdelp+aUo4qrS7DVE3Wp3Ej7aNZF0wY+kiY8iRMIMOqOPkVJuGDhCaN?=
 =?iso-8859-1?Q?Ot7UcOApE1ZW129dWB+cD5h82PtCJ9HTJFw/ICJnbBhyV2ib6yUB+KjYtX?=
 =?iso-8859-1?Q?Jf3zOXwO4vC/FBMNAYVFGMGFWgY05PcEKJeavR/rAu61nMz5Xjec5PK75E?=
 =?iso-8859-1?Q?IxuHIYcezbfqrcG9WXGsmMoGE7akoROri8m8oNeL+6FE/Z/DGw/B7bEBTq?=
 =?iso-8859-1?Q?xJtB0I8QsJulk6pZAluzQeNL0lwFNuGs6g01RX/SpyMRHqD07teSe+5Bqg?=
 =?iso-8859-1?Q?Rz2tKs8UK+do1Hpo09+useIllST66unfemrL3WRIanUnAProvYJLK1u5Ag?=
 =?iso-8859-1?Q?MmPzxwjXVEFZtGFMpiMGPZ+ObLIGeortGjbjkKC3bD4ucjuBFyzL48v2P3?=
 =?iso-8859-1?Q?TLlPbiQAUz+iCmqLY0lyZHN5gmOOG9/6tKC3EARSq12hjXnYfPaVns2Tw5?=
 =?iso-8859-1?Q?l2vLhJErvoCktaiqHsZVByIObRxaO0QLla5hCAhTes72JZdOzGcqz7nd5R?=
 =?iso-8859-1?Q?DQX0V8vr8BqZoVdAxvjD7oPy+WIZpKFVJ2QIWxcuGkK50EOGqz6IUOSeqI?=
 =?iso-8859-1?Q?9MUwv4LPoX048LIsAWX+PGe7z3hbyoweKx+6LvxWeD8PpFc1JI8N971eu/?=
 =?iso-8859-1?Q?Q543tyX5tavRDj7FIshCA6laiUwLurvvmoQVYNPkHZQFdBOglK17aDZrra?=
 =?iso-8859-1?Q?ySiZC6crlaK8hIUHWm2yldp8ipArgVw6gaOFviBCV+97eU1LoqKI8qY9zO?=
 =?iso-8859-1?Q?UFv/QpzqiFp60girixFoTcmRmJcRn2TmiiV8rjJcmWYJOyNpwdUTzDdMqQ?=
 =?iso-8859-1?Q?4re4k9iITtyd/aihVJrOVyVhiHZpLUtWsaW3wGxKgszCHEd6De2GtpBKQm?=
 =?iso-8859-1?Q?2jAR2xrRYkGlejpE275sHbl70GdimCJrPyUtou3jjbcy/B0SEIS/DVC1sE?=
 =?iso-8859-1?Q?LDaHvZ6DOHfldigGluRjekVpVntCUt4Xju2go+xKvQCKABZlO1E+ah9nfq?=
 =?iso-8859-1?Q?Xqcp5Ledv2Z6Xkpr+2jTcT9hCFyPWXjgx4QwJByN+LPRwA0N2m6zb9k7cu?=
 =?iso-8859-1?Q?zLR955saNAjG2guVhx6J7N4H/gcMtcVI+xz8dHdnT59fkN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facfdd88-cef5-4e07-06e3-08dec18e2dde
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 16:35:53.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xA/RH9av0lY2ztXpIKKP7fJhj7EiyPTstXKUxIA2S+aCKQn2m/ExZia1/GpXBHEnr8fIuxLsJO9spPKRZxRZqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12194

On Wed, Jun 03, 2026 at 02:50:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Invalid interrupt trigger type (IRQ_TYPE_NONE) specified for the PTN5150 Type-C controller.
> --
>
> commit 5a2bed0fe2fb89d900dd21def4f8d915e89c7039
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: imx8mp-var-som-symphony: enable USB support
>
> This commit enables USB support on the Symphony carrier board. It configures
> the PTN5150 Type-C controller, enables the USB3 controllers and PHYs, and sets
> up the appropriate I2C and GPIO bindings.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> > index 25f707012f62c..76928b0058265 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
>
> [ ... ]
>
> > @@ -95,6 +98,22 @@ usb3-sata-sel-hog {
> >  			line-name = "usb3_sata_sel";
> >  		};
> >  	};
> > +
> > +	/* USB Type-C Controller */
> > +	typec@3d {
> > +		compatible = "nxp,ptn5150";
> > +		reg = <0x3d>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_ptn5150>;
> > +		interrupt-parent = <&gpio1>;
> > +		interrupts = <5 IRQ_TYPE_NONE>;
>
> [Severity: Low]
> Is IRQ_TYPE_NONE the correct trigger type to describe this hardware?
>
> While the extcon-ptn5150 driver hardcodes IRQF_TRIGGER_FALLING when requesting
> the interrupt (which mitigates this on Linux), device trees should accurately
> describe the hardware independently of driver defaults.
>
> Would it be better to explicitly specify the active-low or falling-edge
> interrupt trigger (e.g., IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_EDGE_FALLING) in
> the typec@3d node instead of leaving it unconfigured?

Looks make sense, why use IRQ_TYPE_NONE?

Frank

>
> > +
> > +		port {
> > +			typec_dr_sw: endpoint {
> > +				remote-endpoint = <&usb3_drd_sw>;
> > +			};
> > +		};
> > +	};
> >  };
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1780497188.git.stefano.r@variscite.com?part=2
