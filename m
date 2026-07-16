Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011030.outbound.protection.outlook.com [40.107.130.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9126AF4;
	Thu, 16 Jul 2026 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206799; cv=fail; b=W0k4NqGpocigISY26dDDxG8yqmrEDQn/+q23DFHbH0OjfWJPzi/wpnML7HAg5d+9qt5+YM4VjTCF6Tsv+DguNMqJ7Xml93Ex/FSUfLUV9f/D6TFGgi5w5U7xEbPMa5Y7X7zgEaCKc4MCv0agjXwU8VqYG+VArbtJcoREp4oHeGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206799; c=relaxed/simple;
	bh=NY4eeee8d4NTjshWm1mQhspPohn2tXBn6zjfVgpDdG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iRAY50luknQwVU3uI3vyawQrkAPbVCsgCkElrK/mcS9qs+4wDGXCGmi4+DY2xjCBF0/tmH7FzEuNYEWModWc9bQkD5/RJ2aOaMkzjE3vq0pLScC4goz672khh5ufZNaAh4eCUj4KCjJzoq0ZDarKt0VP54NQGQPBQjCTNnMaya0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I5VnGA+K reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I5VnGA+K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyriSgOAJ1yevXR7zRlyo6aZvji3sjwqOyS5uLwOPAYJYt16GrfdRjYHR78eMHhs5ksagFfXPAeI556gbUfV7Y6ZirTE3quRZ++HBv3kWeUGnuqqAX1XvD1Ex8OQzCw04/zujJtVHEMwNAcWejpZuwYSmIyyfgD617LZGFe9pIgzmMY+ODEKed8T8JivSYKBOi820wZkhR0t4zSk35nmwucwbVFQ9o9zY4xGo1wmReFnnwWhKLbZyL8HCZX2Ig5em12Qm9E+MKU7IY/Fo4ti9scfHRfRyeokyGvFpVtVAkckbfdzd40dsHOACaBbgfd0YHVK01Jb90PF7XbpXBcXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/zLpqry7qVauS3qG7B/cGI7ywU9x1DrkoFUFPGQZmA=;
 b=EnR/OS7UNIitzXV1T0hD0v7N/Wdwkv/OPFWEvXgfF0prsSueNMbYC6ujd0JkMg7b2Qcgc/sKIst5Me1qFoK3DdwKorFJuVDJCXWp3IhuE52uzArxIAmhxXrN4EruJQhf+tgwwJucYw5i2j6Ihx6aGlL5rA2vEVlk0mdrBA0ZfQWB8X2HDXHvhkUv56ptWKrw/nA9dWuCOv6yR7/8hLSSeT6dmFFox1h1nLwVpJgX36n8tTPaji8L0wJFNwe1ifNdPI43uRh6D1VXRV0gDlcCxHSosrVkjcaXFg7gqWLEsP4NRZMRlWiySjK+tlqn2meKnmO0rs0ETvoLkod/QUefxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/zLpqry7qVauS3qG7B/cGI7ywU9x1DrkoFUFPGQZmA=;
 b=I5VnGA+K3vgwLWXRk2qy9F2lsBAeTw8EWYanubDdjNuOzDPPFUkr7LkjIiQcEKx4wAdz03CHt7/FncVHhvvXDxmDljVLpWtSfvyn5GVt4pXZD3VxGz2IAzl6VEAFsUfl774hcoPp5zjJtuPGHj8dPz1wDifYS8g/Xqho06zB/AuRTqxp4TSWVlKgEKzi8kjhIOt2nrGfBuZiXK1drVX80GW+y1QRqdcoG8eWa7Wsewz7lqdCHOkb3g83Q4UnaUKeM3mfrgrep7hx6353Qwiv2l6X2ftSBF+ibx3PWZN8Ag9xvn26BicIdZM0Qnl5N7to0y7pvhmVVMPUQNYh5VzfSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12145.eurprd04.prod.outlook.com (2603:10a6:501:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 12:59:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 12:59:54 +0000
Date: Thu, 16 Jul 2026 07:59:45 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: guoniu.zhou@oss.nxp.com, Frank.Li@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, media-ci@linuxtv.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Message-ID: <aljVwX1wzPqV3c_7@SMW015318>
References: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
 <20260716-csi_formatter-v12-3-2601d17fc4af@oss.nxp.com>
 <20260716072052.A20961F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716072052.A20961F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:806:120::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12145:EE_
X-MS-Office365-Filtering-Correlation-Id: c28580eb-49c2-4b10-362a-08dee33a2122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|5023799004|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	vCcEFSHDZLYI3aVTzMnBU6mCmafzaddPqbPBATQ+2yXwk5GsY9zAoCnKF+fkxKGw0b6TagfTJS15AjRLl/1OafIrooHQfRmOxDwAk1hnWnLozarI83IkA1hfMFRvXdN2a4hLQoUWsWPAwg9gQKVO+3nl0iBW7GKzr8hJU7Q71a6gy9yNYlbEEsjsPjwf+yNlBGM3q3EeVad7bUiJdBZQYQYvT6f30RBAePFoCjEjkkbvdIie3NmTJgKurBc3FqZ2VIUHAstYXhTeld99a4mt0JwUQoOQ4FzAOpCY9ws78q/wkEY76BadVzp1h3zhtBJWxlsJUkpzWvBOCijKYNt5krUezrEN1GzYaWU7QX2xwaaKXt0JjJQsDdGePKHq/laGV1su0izZd61X/L/upV8RPeiyD1ZrwIklT6+Cz7YkkI9UYt+ydqSU1TWMRdJi7t0RWYp3zLANpyGPQoeyLJyiWu3pWjhBUI6XgkPjC2/Rxb3Ji+cqS5gmAtOKL8Ech576oIpAtcoYC02hIKrbUDYPVL2lTVstDDNTETjHzgOgoQG0Bst8GEh+XgUmGLGGPhpgVmH0sOJZyrb5P4LLTaV3NImrA+Wx6DMWjJWRHcXkQMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Pc+Umi9TM36ADICpUCduSeHOfVVVI93yEKSU3C//elMlldBHNtmVgRLAvN?=
 =?iso-8859-1?Q?ErP20ORp6Eq6AZew2aAr+8D2pBZUYNV82UUOHztOXJlG/PJ68Xocete6R+?=
 =?iso-8859-1?Q?1s3zhlmVV0qFJHZQ8B3oFEiK+11XqxcvB5trW9LiyY8/1UUaRnigFZoo7C?=
 =?iso-8859-1?Q?j1dQIO1/aei8hH/0n2zq2tbXlIOOXCXD1Y3IzFstmppSc61QfSawKUV0Qe?=
 =?iso-8859-1?Q?b46xrx633gebtuP2CbRQTwxmi/5wnxykvQyk+6o61Bwo+F8cUSZ0RwGr6W?=
 =?iso-8859-1?Q?XJe7sijr0XWNNFDWkQR7INDUxFC0uu/ASH7SvY04JEJWODpsTZzYLu5E9w?=
 =?iso-8859-1?Q?WA2uuDKFzp81Nq1M+DFU6lvsZ9DhA6yZ4bmYikXGE6vAWRIgzzymgUxEzm?=
 =?iso-8859-1?Q?XRBzACs6//rKE8asnFyxP0ckqDy9z1wUSOhtIM0zKKvZsyJ/HhaAoxTGNI?=
 =?iso-8859-1?Q?mh9qBTxxsm9yzVJmpyL1B+oAwk0ohwZ95U5ZMOO8mHyWjrBCLA6slCaLR2?=
 =?iso-8859-1?Q?pZzZ7y3uM/IuMTuIQzt+/gBaVX+U8BjPRs6Iwtkfwog2yNwiJH+oQ36D2N?=
 =?iso-8859-1?Q?VT1TZNmcxqvXnlf1/TwKMDl48irkju6fJU+iJGUdFIGGYK+Fs2qE04Wxx0?=
 =?iso-8859-1?Q?LChob6aMbnWET9n6zObTp1XDBhmnNzsHIW4YdW6DXVPje1rmReunS0hZC3?=
 =?iso-8859-1?Q?7moiyZxXyx8xiyt+axhXVsKkyGQ4e4+SEXmiwCNIGLrbWkmEOr4A1VJkMZ?=
 =?iso-8859-1?Q?+HAOoG3zVl9Eyn/vKGM6cqWgsU0rHXEYrpuAAmGOwP4gZiA0KCZ26GQhai?=
 =?iso-8859-1?Q?tFkDAt/U4hkuiyPZxHeSSXbj9zPYzJofw+YggAoD7gHnnR6jf3/cy03/rt?=
 =?iso-8859-1?Q?PSaP0c+OuAx4Gk+RhQJJ3MBU8gMXdvxEyfPdXafJ73gPKTNmVek+b2mzqk?=
 =?iso-8859-1?Q?yBfO3PsHt22YTBNmBsue0USsKjSRIQGExaYZATo0AYkXql2tiMahzBoGhG?=
 =?iso-8859-1?Q?ePqt4lrRqc4x8Xrb74nSgw6LP6yl/wfm9P4rOGTRnTYznJsXTZU26cgQh4?=
 =?iso-8859-1?Q?f5moO0LqVdIchpKYk1F+9nSZuJlDNzjNX4Rf9E9wSOmEtNreyeacKcjUy1?=
 =?iso-8859-1?Q?5vrWmgJEQMNaf18svb0atEqpeOUntn4+TryNRvWn2NNBsc4y6CSNl7meTk?=
 =?iso-8859-1?Q?NGop3wyCU9eLTUqAx0Vc/4mw9SrQpNnfpuQC4eXVEBwcKIiJ/gobIRjSQ6?=
 =?iso-8859-1?Q?rTjy4x7FMqkZ2zhum/nTwT8nfeJHhDmyzBQmncT58trzJd//bDEwv7C4sZ?=
 =?iso-8859-1?Q?kiv1RM2DC60LcUvtmoLpsvlT0PNxBJ/FXKrYn58gmGi7wRZJhfkIrhr2Tp?=
 =?iso-8859-1?Q?FGPJieACsEgywWPqDlqfUo//mc2bBxgqZR4N/cv9X36zPcNo1ltKslgzlX?=
 =?iso-8859-1?Q?D+SGqKCEMGKjxqRfOsJHQOy0yenkRC8HbYcCgJczbsNf9/xCIpjVOi+7mU?=
 =?iso-8859-1?Q?Jy7S96P6yjvDDIJkJLRad5J2QuYfMOCAig9zdCL6BxpaZE1AD/oB1REqe3?=
 =?iso-8859-1?Q?q64Um7UXGYsuUPgPHXhAFr+eo+7UIfic6LliCMNA5wx+U6rN6pAaNN4pwX?=
 =?iso-8859-1?Q?Fc6OXHnYH+O0NR6U5GhCtwqYAcGQb9kh8c8MyA6gZ/DFMWlCLrVBRG8UVr?=
 =?iso-8859-1?Q?kBasT89NTn5ZlU7Yn5w524IXae7S7OnK3OzRdnnrnulNchow/XLo7MLwaR?=
 =?iso-8859-1?Q?LBIxr7COvKDlX1LAViUdDbVloIVdjMpLS9Od90N+Zs2DzWH1qqJ7g5O7/t?=
 =?iso-8859-1?Q?v7Cj17a4byTo9xIzww58FdBFHUsl7n//VmxYGJ8Mh5D7v9AxASg8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28580eb-49c2-4b10-362a-08dee33a2122
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 12:59:53.8971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: picHJ+xqdLW9XA31H3j12iHtDAHHDUWKvftPMPwNuSkr1gSpIJrSg+ApJVpSG6K0A/ntKxYfQ0Hj7VFDTRVfkLtUDTphf2+5Nc5h5bkY9tdq4dxrrR10fzu1oxguUlsn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12145

On Thu, Jul 16, 2026 at 07:20:52AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Missing NULL checks for the return value of `v4l2_subdev_state_get_format()` allow userspace to trigger a kernel panic.
> - [High] The driver caches a pointer to the remote subdevice when bound, but fails to implement an `.unbind` callback to clear it, leading to a Use-After-Free.
> - [Medium] Mixing `goto`-based error handling with scope-based cleanup (`__free` and `guard`) in the same function violates kernel cleanup guidelines.
> - [Medium] `csi_formatter_subdev_set_fmt` partially modifies the subdevice state but returns `-EINVAL` if the stream has no active route.
> - [Medium] The `csi_formatter_read` wrapper ignores the return value of `regmap_read`, potentially leading to uninitialized stack variable usage.
> --
>
> --- Patch [3]: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver ---
> commit 0cff6156940653a6a408d93ee678b339b7218ebb
> Author: Guoniu Zhou <guoniu.zhou@nxp.com>
> Subject: media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
>
> The CSI pixel formatter is a module found on i.MX95 used to reformat
> packet info, pixel and non-pixel data from CSI-2 host controller to
> match Pixel Link(PL) definition. Add data formatting support.
>
> > diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/media/platform/nxp/imx95-csi-formatter.c
> > new file mode 100644
> > index 0000000000000..cea60327c9729
> > --- /dev/null
> > +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
>
> [ ... ]
>
> > +static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> > +					       struct v4l2_subdev_state *sd_state,
> > +					       struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
> > +		struct v4l2_mbus_framefmt *fmt;
> > +
> > +		if (code->index > 0)
> > +			return -EINVAL;
> > +
> > +		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
> > +						   code->stream);
> > +		code->code = fmt->code;
>
> [Severity: High]
> Can this cause a NULL pointer dereference?
>
> The V4L2 core does not validate the stream ID provided by userspace in
> VIDIOC_SUBDEV_ENUM_MBUS_CODE against the active routing table before calling
> this function. If a user passes an invalid stream ID,
> v4l2_subdev_state_get_format() returns NULL, which is then unconditionally
> dereferenced here.

Is it true?

>
> > +		return 0;
> > +	}
>
> [ ... ]
>
> > +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> > +					struct v4l2_subdev_state *sd_state,
> > +					struct v4l2_subdev_format *sdformat)
> > +{
> > +	struct csi_formatter_pix_format const *format;
> > +	struct v4l2_mbus_framefmt *fmt;
> > +
> > +	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
> > +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> > +
> > +	format = csi_formatter_find_format(sdformat->format.code);
> > +	if (!format)
> > +		format = &formats[0];
> > +
> > +	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> > +			      &sdformat->format.height, 1, 0xffff, 0, 0);
> > +
> > +	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> > +					   sdformat->stream);
> > +	*fmt = sdformat->format;
>
> [Severity: High]
> Does this also risk a NULL pointer dereference for the same reason?
> Userspace can provide an invalid stream ID during VIDIOC_SUBDEV_S_FMT,
> resulting in v4l2_subdev_state_get_format() returning NULL.
>
> > +
> > +	/* Set default code if user set an invalid value */
> > +	fmt->code = format->code;
> > +	sdformat->format = *fmt;
> > +
> > +	/* Propagate the format from sink stream to source stream */
> > +	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
> > +							   sdformat->stream);
> > +	if (!fmt)
> > +		return -EINVAL;
>
> [Severity: Medium]
> Does this leave the subdevice in an inconsistent state?
>
> If a user configures the format on a sink pad stream that does not currently
> have an active route to a source pad, v4l2_subdev_state_get_opposite_stream_format()
> returns NULL. This causes the driver to return -EINVAL after the sink format
> has already been updated in the state earlier in this function. Setting a
> format on an unrouted stream is generally a valid V4L2 operation.

look like make sense,

Does v4l2_subdev_state_get_opposite_stream_format() call before fmt->code?

>
> > +
> > +	*fmt = sdformat->format;
> > +
> > +	return 0;
> > +}
>
> [ ... ]
>
> > +static inline void csi_formatter_read(struct csi_formatter *formatter,
> > +				      unsigned int reg, unsigned int *value)
> > +{
> > +	u32 offset = formatter->reg_offset;
> > +
> > +	regmap_read(formatter->regs, reg + offset, value);
> > +}
>
> [Severity: Medium]
> Can this write uninitialized stack memory to hardware registers?
>
> The wrapper csi_formatter_read() ignores the return value of regmap_read().
> If the read fails, local stack variables remain uninitialized.
>
> For example, when called from csi_formatter_start_stream():
>
>     u32 val;
>     ...
>     csi_formatter_read(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), &val);
>     val |= BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
>     csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
>
> The driver performs bitwise operations on val and writes it back to the
> CSI_VC_PIXEL_DATA_TYPE register. If regmap_read() failed, this writes
> garbage data to the hardware.

It should be fine. MMIO never return failure.

>
> [ ... ]
>
> > +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> > +					       struct v4l2_subdev_state *state,
> > +					       u32 pad, u64 streams_mask)
> > +{
> > +	struct csi_formatter *formatter = sd_to_formatter(sd);
> > +	struct device *dev = formatter->dev;
> > +	u64 sink_streams;
> > +	int ret;
> > +
> > +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> > +						       CSI_FORMATTER_PAD_SOURCE,
> > +						       CSI_FORMATTER_PAD_SINK,
> > +						       &streams_mask);
> > +	if (!sink_streams || !streams_mask)
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&formatter->lock);
> > +
> > +	if (!formatter->enabled_streams) {
> > +		ret = pm_runtime_resume_and_get(formatter->dev);
> > +		if (ret < 0) {
> > +			dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	ret = csi_formatter_start_stream(formatter, state, streams_mask);
> > +	if (ret)
> > +		goto err_runtime_put;
> > +
> > +	ret = v4l2_subdev_enable_streams(formatter->csi_sd,
> > +					 formatter->remote_pad,
> > +					 sink_streams);
> > +	if (ret)
> > +		goto err_stop_stream;
> > +
> > +	formatter->enabled_streams |= streams_mask;
> > +
> > +	return 0;
> > +
> > +err_stop_stream:
> > +	csi_formatter_stop_stream(formatter, state, streams_mask);
> > +err_runtime_put:
> > +	if (!formatter->enabled_streams)
> > +		pm_runtime_put(formatter->dev);
> > +	return ret;
> > +}
>
> [Severity: Medium]
> Is it safe to mix guard() with goto labels in the same function?
>
> The kernel cleanup guidelines note that the expectation is that usage of
> goto and cleanup helpers is never mixed in the same function to avoid
> resource leaks or double-free bugs during future maintenance.

This should be fine if goto to error path only

Frank

>
> [ ... ]
>
> > +static const struct v4l2_async_notifier_operations formatter_notify_ops = {
> > +	.bound = csi_formatter_notify_bound,
> > +};
>
> [Severity: High]
> Could this result in a use-after-free?
>
> The driver saves the remote subdev pointer in csi_formatter_notify_bound()
> via formatter->csi_sd = sd, but there is no unbind callback in
> formatter_notify_ops to clear formatter->csi_sd.
>
> If the remote subdevice is unbound (e.g. the sensor module is removed), the
> V4L2 async framework tears down the link. Because the pointer isn't cleared,
> subsequent calls to VIDIOC_SUBDEV_ENABLE_STREAMS on the still-registered
> formatter video node will dereference the freed formatter->csi_sd pointer
> in csi_formatter_subdev_enable_streams().
>
> [ ... ]
>
> > +static int csi_formatter_async_register(struct csi_formatter *formatter)
> > +{
> > +	struct device *dev = formatter->dev;
> > +	struct v4l2_async_connection *asc;
> > +	int ret;
> > +
> > +	struct fwnode_handle *ep __free(fwnode_handle) =
> > +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> > +						FWNODE_GRAPH_ENDPOINT_NEXT);
> > +	if (!ep)
> > +		return -ENOTCONN;
> > +
> > +	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> > +
> > +	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> > +					      struct v4l2_async_connection);
> > +	if (IS_ERR(asc)) {
> > +		ret = PTR_ERR(asc);
> > +		goto err_cleanup_notifier;
> > +	}
> > +
> > +	formatter->notifier.ops = &formatter_notify_ops;
> > +
> > +	ret = v4l2_async_nf_register(&formatter->notifier);
> > +	if (ret)
> > +		goto err_cleanup_notifier;
> > +
> > +	ret = v4l2_async_register_subdev(&formatter->sd);
> > +	if (ret)
> > +		goto err_unregister_notifier;
> > +
> > +	return 0;
> > +
> > +err_unregister_notifier:
> > +	v4l2_async_nf_unregister(&formatter->notifier);
> > +err_cleanup_notifier:
> > +	v4l2_async_nf_cleanup(&formatter->notifier);
> > +	return ret;
> > +}
>
> [Severity: Medium]
> Does mixing __free() scope declarations with goto error labels here risk
> cleanup ordering issues?
>
> The kernel guidelines specify that functions should either convert all
> resources that need a goto cleanup to scope-based cleanup, or convert none
> of them.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com?part=3
