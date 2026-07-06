Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4E42466F
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356965; cv=fail; b=ms/WBvfqx6djBeRoRwjeBvc0jSJTATxzDeBO8vZ8+FWmWZZMcM41bDLIGPLsJIxHFbH2i/e/LTyxVv9gE0ulxKCDg/xWiHOePw2aa963/N7J4Jq/MixFZY4DvS1RhYXHvNKU1H+YyHkbfhxK2M94FQuHJyYKtcLj1r0gYEiW6SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356965; c=relaxed/simple;
	bh=N04Vh9iLgoOvJ+Nl2j6BzAJcVYnB3FbB3g2p1Gcv+ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tOi4nsMY46bHMS1RPrf1UtZysRXRiGfaSW6dpavhFMtWgMbLBscnpRt/RFf8gY3H8q/lfV2Qk/9YZodhhE+Kq1kJwFXZwON8vzU63+mMUFq1RxSTPKt6klsMTI17l36JhfAJvjwfPWDT0SIQevI8kJOb+36s/9vGw69h7Z4ity0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B80rDejK; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B80rDejK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDrEV4fhKYC+gRmiZ1kzNQsXwu6+X9t3ht7F06aKE07g0ncVJzYE9Yl4jnioacfd6z7Ku1P+6zKtH4NUebdv1rr5Wo/p2c40U+f6JQCw39jtOUiKUb6L/JiEimyvYEjjxmku7O27Fj9WyaFGTE5cVIGPY3wDdJWE6MB3Bu/dPoEA0CBlQ11hCQJg9LWGQpiC7+PDW69Iio3DxBOmtC2I4ZYUM/SYVOuhynHcdwMlQkJdTKPQXEZebD+E4sK7DiB7W6XhIAQIsZRRDyzBPt5CXHqWgZYH7XiHQ1icHgP03wIF4QXVsjEnk94yXQnlEEPvZD6gZSKVBQe1/IO8GBAjsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYjR00RMogkEcn0TYU32WnFq4oGsLhXs2w25U1oAqb8=;
 b=iBjn21tBTtEXgLK7FemCjyHhMdft6LmtkpiMnzmDD9yNcEIjcgBOu/blvnHiU4ua9wXqylcF5Qrb+gSvfQGnt7SQb3Z2P99lkcB6cpG+Ka6EN5OJ2os+oIYVd16wUb5u+utZIwk3RDA+oaeUid+tY5tOUmzEJ3WWNne/n8y2GRbdird2Sz5b3gcHCbZHU5cEExrxDWMe68nn2Ml6X/Y0HP8ouP96KuvIHGEj9lPqEc1IZOFAwFsetBU2jZqx+aX/61d+FBoywu/Ezvy6i9o9ye5V5/lamqESDZWhGlbG5VtAddb2rvM57fIv+u5sFyzPwDqLca6X+oGrDKMBs4lF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYjR00RMogkEcn0TYU32WnFq4oGsLhXs2w25U1oAqb8=;
 b=B80rDejKCI7CLVkXiefQzPr6l4eOfkzSbXJ//xM11MGQ1yksoOnXn/fKl7K7/Vy3VNUD3YpT2PcLc1iE2kk5DK1Lyq9Gdaur3BFkY3sZt9WJANCDhxB2shnZENr4I7Uo9h67pFq+UdTc65Bn77IGW9TG5ofARqCuuV0aWSzEKcPuZEByFVoqq3j5+Ge0p0WtuZFeqYw7qZEAgWKiIf2nhsa3UefO4v+0bWF1HsxfW+/RePs+wheszWzBglUwzZPijvYoZgk8RV/MNz8+P7SKkq1EL1ITgx8m7ctyzrXto1v+J32vWDDrxEgFVZ7eodJughzvOmIfJ6fDtyvb5RsqCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB12010.eurprd04.prod.outlook.com (2603:10a6:10:640::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 16:56:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 16:56:01 +0000
Date: Mon, 6 Jul 2026 12:55:54 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: Re: [PATCH v13 5/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <akveGouWzKOKLiqo@lizhi-Precision-Tower-5810>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-6-lakshay.piplani@nxp.com>
 <20260701072319.165A41F000E9@smtp.kernel.org>
 <akVtnLsdN4ZEP7XN@lizhi-Precision-Tower-5810>
 <AS4PR04MB9362B88A0273E3AAD52E812DFBF42@AS4PR04MB9362.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS4PR04MB9362B88A0273E3AAD52E812DFBF42@AS4PR04MB9362.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SA9P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB12010:EE_
X-MS-Office365-Filtering-Correlation-Id: ac667623-a32d-46b3-b2f0-08dedb7f7541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|3023799007|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zCSTKlScQqR9VDEYBJR0D/V7aTebmjM5JBTsPGLley1e/iLWe/3LC6QOoHNXQ/ZiGcXvVD4QS+Zskgw6jMR5N1Q8TJEdQC1m7pBeOGy+Ikm625Tft5U2yduK/L6GRur4BLznStr2UNZMhTykleNICkcV/OkmO6cL0AUgBcfK5v7lUnsM38KfD4Qhu54MfiBt2mLZKg8St9c5BXbAr/lUDa8b/M/eF3xvUYOvYxrtUHzjlLwhhHnD8d/xrm23z1TV5wQxepscb2JRDtwt6pWbxAEXnzyjXtvvJZ969FBJImWQw7UFIFONf5IguBGWiFGMI+JD+5XignePgs4E5yEi4+PA/RfwrQFgDL50AJYrXM26CdfBloZFyR4vdGZACDD3ANFIwziGUp+ku0fbvv6h84++A0UWDhI0kfxYWhxIKkjdJXu0ZjgOegdfkBsGZhmV9oSbztjnloOvUJ5IdOkElb7b8LE/NXUtHsLUH2OfqIxI3HG5fQ68NMoh8vEzPrFlJtLnXdagZzWrWa3/tgV3cYEsswpIDmEoKC5jAdu9Ix0k7UDHD87UfQmxGVAdNn8Odm3yESV8bOKNEv7QZYr+yjB66Y9DxBzMQqTdNVettqKRNDV9wsG55PHU53PtBBTVUsqDeysUm8SL7z556aV9aUGeJiA4ykNc/r211juN0EA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(3023799007)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ogmHA9izghzvXTDI6LH2uiHD7FqHl6YQgL2csA1flc93m/tamfX66jpXP4I0?=
 =?us-ascii?Q?BBZ2TDUCf5+aHS/zMW8kVMGYY8fqOKdx83Nh/SFmnMaC1dJkg8On0MgEuJ0i?=
 =?us-ascii?Q?M2nAwRG1GAfitPtxKjkYlNhTV1ljhBYdC+VdZY5T1A3poRvIm5pJBbpIf8U+?=
 =?us-ascii?Q?pmTOClU7Fc6Db115pggKPG4u8ZxsTuk5QxZy0O14BlvKdDOTfMtx/19Vcq+A?=
 =?us-ascii?Q?wNHK4KXhY60/mhJzS+BeLaFltxhgXrjiSov61TxJynxAVx+M/2ndGnNJV7uC?=
 =?us-ascii?Q?FfzKdy8AGhaf+OXkq9lZRTptiHk1X4oL2NUQfWO69t9Xe7Y9NoiTUvxLN/vM?=
 =?us-ascii?Q?SQ1r+n/myB76IcojKpMGIyQTMNxBvYBiEetkAnc/4kJPuNSbI28Uvp+U432A?=
 =?us-ascii?Q?rfDNNOvCNfTWgDxKyJfVFgWjo9yEDlVv5PokD1Rrq6woNTakyFXiQTdbzHmp?=
 =?us-ascii?Q?NuR/HXUmrT85feyjauJQKA2n47oNu8oVS1QFERGAaF09agPuTSanaF94riNj?=
 =?us-ascii?Q?TD/VlBnAMsDPgTVm250ByG7suIuuSurscgFuGOwH+2BBg8AWBRgMC/22rjEN?=
 =?us-ascii?Q?feRTl+ZgCUEsxoCyi5FKgruo8sBCNPmY158L1cxmQR9R+CY9VcpFu9hyCwlX?=
 =?us-ascii?Q?U9msUAmlKsHYIMvX/faTDPgMdn4dfEZnchBsEWWpJFVMqz8b30rkm3+nGqRu?=
 =?us-ascii?Q?3NRk1jyBLBDu7xA3bRKR+uly6YhyBWitfaUggHuE7boeWccvRin0mXN47ZF+?=
 =?us-ascii?Q?wFmKoWSfqAi6AcbZpZQMZw0SNjWWzu32HM08mgdoP7nNmr79y55fQ86p3KBn?=
 =?us-ascii?Q?Fko1mJoR9SSSgM6ti4eHk06EAIDM+BFP3l2EDdlqsICOIDUAoKRG12NxlQF/?=
 =?us-ascii?Q?tjPFpWOAKs9oiCnQosMT+IJO4aDLVBesbVw6K2XeuOB1uw2+xMhkQ7exXnWe?=
 =?us-ascii?Q?zX2/s0VUxuYO34aLHlbrRKgo8ZBhkIJoivtSskL2w9e+wWjqAovP+rtGsNME?=
 =?us-ascii?Q?Ct0Q4uH42ZrebMx4gYcC9ZHMWmw76TRGZa86PdVqcsP/N83owP7SjnvLxvTl?=
 =?us-ascii?Q?QurWuuZsitJHPCa/MvV2azXZ4W7EdHM4qyJcctzlmHA4N1nhPgf1HYZ6ox36?=
 =?us-ascii?Q?WQIT/ZvR/x4JKhMDndSCwj8ddLh5iRKdFG3QlJ1xfYwaH5bjEGfAXD8NAG0p?=
 =?us-ascii?Q?nfEaOSGL8nxwmZheR3vpo4BD7wsxutKRBxJReEC3MJiL1TR38wmRzT4TH/e2?=
 =?us-ascii?Q?5KryTfnP7qPkHxFq9LA2rm56Lx4AIu6lGWYSdpx1c64lwdB9YXrMAjO9pBlJ?=
 =?us-ascii?Q?r09QepZGATB1CiIQjoBwxUHMb5fEDoxuLc7gjhcynJD1P4vkONNm910m9ezl?=
 =?us-ascii?Q?T6Yijb4FGJ35WlMKm/1twnYP+kPS83a1Zj6H7UQgs72s4BMyfiVTDQs2EkqU?=
 =?us-ascii?Q?wHV+3l6mxB1OIfG9RWoJ2a0XiqrWh3Rfwuf4kw3pV24qvyZ/COORpJls02Fq?=
 =?us-ascii?Q?WiMkajpcrlO1aIJjKNqqE42w1z8u7QvxvxiJahmmY29bHQELck/9v8M0Xzqm?=
 =?us-ascii?Q?riDxqnpAK42aOg+VzzIVPAfv/PCSzKVLuTp9cEwJuheXhiwlLU+JiEaEhCzu?=
 =?us-ascii?Q?tDZjiz90ebeYhl4UP3rF+5d+D1InWQX5eQ7Gc7Iof3qlo2gDNy+JNK9HcD+o?=
 =?us-ascii?Q?5HSCIJOjcTWaJ9i9R3sAH5fmqX1Sovx5XC7IYpMhaHjkPLqE7bPSmmxpTpqR?=
 =?us-ascii?Q?Yr/VZT322il3o/TaJgQxC9GFPAxuWHhtJ2zoTSlsNkzUrpPs5Sxp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac667623-a32d-46b3-b2f0-08dedb7f7541
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:56:01.1803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfV7rmwglErJrykOMWz/zZ9X0eg7uwRnzo/Y2It/LKeDhNd7/RWwnMGjss4XroyK3tlk/KF7I/5ntIEKju/T2wDayOQgd4COaT9AZ3qx1UfEsjWvgY48G+OsankspJNB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12010

On Fri, Jul 03, 2026 at 10:50:30AM +0000, Lakshay Piplani wrote:
>
>
> > -----Original Message-----
> > From: Frank Li (OSS) <frank.li@oss.nxp.com>
> > Sent: Thursday, July 2, 2026 1:12 AM
> > To: sashiko-reviews@lists.linux.dev
> > Cc: Lakshay Piplani <lakshay.piplani@nxp.com>; linux-i3c@lists.infradead.org;
> > robh@kernel.org; Alexandre Belloni <alexandre.belloni@bootlin.com>;
> > devicetree@vger.kernel.org; conor+dt@kernel.org; Frank.Li@kernel.org
> > Subject: Re: [PATCH v13 5/7] i3c: hub: Add support for the I3C interface in the
> > I3C hub
> >
...
> > > > +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> > > > +			       const struct i3c_ibi_setup *req) {
> > > > +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> > > > +	struct i3c_hub_controller *hub_controller;
> > > > +	struct i3c_master_controller *orig_parent;
> > > > +	struct i3c_master_controller *parent;
> > > > +	struct i3c_hub *hub;
> > > > +	int ret;
> > >
> > > [ ... ]
> > >
> > > > +	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
> > > > +
> > > > +	ret = i3c_master_direct_attach_i3c_dev_locked(parent, desc);
> >
> > All IBI cap devices should be already attached to master bus when DAA? need
> > attach again here?
> > Actived port's devices logically attached to master bus?
> >
> > So needn't switch port.
> >
>
> No. During DAA, downstream devices are enumerated on the virtual controller, but they are not attached to the parent controller.
> The virtual controller's attach_i3c_dev() callback is intentionally a no-op.
> For private transfers, we temporarily update the hub's dynamic address to the target device's address, perform the transfer through the
> parent controller and then restore the hub's original address. This does not establish any parent controller-specific attachment state.
>
> Therefore, i3c_master_direct_attach_i3c_dev_locked() is still required here so the parent controller can establish its controller-private state before requesting IBI.

Okay,

Frank
