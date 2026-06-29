Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97705400E0A
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 12:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736083; cv=fail; b=F9VnjVimvKPwDB6HuJ048w1v6DL3ZcWYBo4L8Vi8dRfYr7tNFtbkGbpIax52N1LJbNcPRFw4UulwyNZGcDQBjBS1uqoEJ1hly45qWxe47UzlWrczOoxq6BHAw4+KlAbjKRe/Gj1dPPtn/gGF/A8IsXVAUmegjRXsRiCEaC4snLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736083; c=relaxed/simple;
	bh=yZAkW1KIdnXpgD95i2kf44EIGaomkuhuLBGTFVNa4r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kAnPsiQ/vD+EALZiD3Ba25PP31NlPIAi6nH46nMleoO3T5Qlf6YBzmRm6NEFyrwSwMW+L7bORRBXMTC7x6smJH80Yu9NhZjcE8o5SMM0GVmoZ27xplp1yQUM+IeEWWB9dfuqRdKQ5JKS7k9sMeE0fOPvJyxxVyGT6/sMMKiADUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m8QaWPrV; arc=fail smtp.client-ip=52.101.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m8QaWPrV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbzgoDoWXexDPFclqOVAeWUR2oSMKDOINArhUySWGDngYYgYCrNrGwROPUmhW8GEsxKEKLBQPrfzYbFdOKEuMuJ280jEKKE9nCRsltds/ueZV8M96iNzLK/bCRxxxaq/tbkRc9ZoSQscPbEw0PntmFkHtDxhEQOf6w4q8fDwtIo498QSpxS2KSza00al7PqGn7QzeQbRNamjpuQqMFOCxEvLAV8zi7J39eN4Ai8AELJlfOPSr6APeIi1be1Aikl0IUJiO+f8vWrwsgF27qK1TLCQlagtqSTk3YuyKLBagizDuD8uzyB+f2Pnev5Li9k/usK/wZJvjlnJ970RJ/wluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZ5UuS0RfBNlc0ggxvMwI2ZJevkv0l3oFQKAFdLWw0A=;
 b=KjhWS+1x4kX9OBFS2jQccLxNBwU5PP+uNeccDUa227Wfy4OMQVpb/vSyVGTB88wgzrb7ucuumh0F3lyWVUMsrixUeWeoSfrHA92L4gfsOxyATDJSr7xGwoDsrKNb1iynQlSa7BEXu9JngNrVEXRlJPc77th/leFkvcirRzTUIy+E5stsiy5JLnIrVsJFnSb5n9T2IyvLrOh3xgVpbhxIQBRJDt88sR0/dETQ/NfHdKxreoHIUVvNJ/CrZkyqvJhpz/hSO83pz+7mWD/JyX0fPGE/Sb2dAsxdznFiOSLAwR/OnyqIO3CFtOJ/lYGuiPvg08DWjB9SSJAmSjOlhQzG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZ5UuS0RfBNlc0ggxvMwI2ZJevkv0l3oFQKAFdLWw0A=;
 b=m8QaWPrVUTpSqly1aqc0BPguG3M1l6ZVI8XWskIlxFssrNODG5jCU/iNWNMq+mMRk/hKP7o8GdOdSmVy+61Ub/GvMSl/9RQaRQQexc7KBL+IlZHtbNPK+G5SqrVxpczSkv7W1hePQlcFwZgo2jfmgckwS6fF9t9U/iPnH8cG6WP3z6UoW1tUWaD1qF3Yzz9QkiusILuc6CVCGodiM7/Ko+x+9Fw7hIaT/6Ry4RE+MlE610YS1IAMOOBkXfjPcm9FCd/w+useed4SNlS4PKB/rJdgEm45T9L02WqfOP/rIVQ6Eo85K/ckxmnHAVF0vqPbj2Ib9Y18PS26tHnH0jf2Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 12:27:57 +0000
Received: from CH0PR12MB8488.namprd12.prod.outlook.com
 ([fe80::c565:c0e5:2c8b:c315]) by CH0PR12MB8488.namprd12.prod.outlook.com
 ([fe80::c565:c0e5:2c8b:c315%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 12:27:57 +0000
Date: Mon, 29 Jun 2026 14:27:51 +0200
From: Thierry Reding <treding@nvidia.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org, 
	jesszhan0024@gmail.com, rayyan@ansari.sh, dri-devel@lists.freedesktop.org, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3 7/7] drm/sysfb: simpledrm: Read panel orientation from
 DT node
Message-ID: <akJkv6T2BhRRyoLD@orome>
X-NVConfidentiality: public
References: <20260625094509.157581-1-tzimmermann@suse.de>
 <20260625094509.157581-8-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5z2yi4vowsobzkv2"
Content-Disposition: inline
In-Reply-To: <20260625094509.157581-8-tzimmermann@suse.de>
X-ClientProxiedBy: VIUP296CA0014.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::17) To CH0PR12MB8488.namprd12.prod.outlook.com
 (2603:10b6:610:18d::18)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB8488:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 8744993f-1b33-4ab3-d171-08ded5d9d9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|7416014|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DV9IImTGH96bLmm4ZNqtsmoWkoO4tyGdVj6lzRZ396qXmP1vu8yhG2mQqZRM13hYuseAmtaRvpiA3Eo+UBJy+gaMdKuumQ5aYqQBqLISHf3tqvlJn+J9sts3D+0f6Def2EydKdaUU3QcIWoZkr3xev7VYmrY/6IQCKENLB6RE2NYwpQv9Mji8B2m/wQ+KXUcr0gyJ0UDgadVl9T112ljV5rq860sSM3Wjz+AVGMZYcH9C+D+n4OBcUWw7257Cray8JRM5TH/nAUJFr/+qliwq8iQ3F9lpF1bBpJq+3gGQ2jswhtEhHBmdZlcNfMqJ6GSpMO3X2DruWkzHIebpvB2Aj2y8cMLHpiBTnM7Cs9gZeaioag4GUzbqnvgoSBRbmebq28wxMRaGb0IcXaqjbupnjEm+dsqhweVtliFIKlxSniNUGRSjo2pp0dMNqjRgYhP9lHT7gLl9+t4DaYCi5QOFGlKOp9d2lGSKgCcw1jkXNSZNI/T2evB1ElpOLwFMwv1K46qdEhAYvAGpKp9a5jlOhjfiKvXAiCP6CTvslxOUcbRB5l25NrIG4xyZj4oFjhBvKGDmVe8efBDrbTWw8Adhv1iHknaBG6mqcJMEkVIFROA4Xmsr7nvKGyjMOClFiQ6YSI6MRuAsU/DGQejG/GApbm8bXst7IYeJUJLtkYwe1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB8488.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(7416014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uhClh/SCqwOCPkD3TADZjm2urSQXtqHtHCIsmufxhow+5QeV2mjxnK3T+FRI?=
 =?us-ascii?Q?KQLZzR2lYsc0cOowtsFjOtItZnBv8Zk1T75MlHlUL89fEyFdLPE2CTdilDb8?=
 =?us-ascii?Q?rRGcp0Hc/G8XAAxtqtYyPmEFJNNrTwTsh6aFVKYZ6X5HU+Avzv1IFbUyvlZn?=
 =?us-ascii?Q?pEB4LmQIBS0exh7oGS6Q3Ew71MUMKvtnre1grbZEjkmkpWEjONlrCYx4zbvz?=
 =?us-ascii?Q?rX9aMAh9vnJwTm7fuTPX3a/Grw7HRiJzHWLxXMvqnRPc5ybg2UC620nRfiLI?=
 =?us-ascii?Q?/0456n/LVywArhQEys+mRFDLjsUADouF7w5XIDf+m0aOw6RCFL32lBH5Fjvy?=
 =?us-ascii?Q?5LqSMbKdiltZ8ppRETkG2Gmute5BWinxhFsJs3ek/Uj/yhLmWj0AdEw7QJ2A?=
 =?us-ascii?Q?i0Ey7hFLRZ6ItjKD0a9d4JmUgcPUriNIG+6gZFMqN7sngh5iZLFWxGGy+biB?=
 =?us-ascii?Q?LiaZ8+86GfDy9ORWnhpFeBe4Iln5xD+2wOxShzCc9b5rfEP+oHsIs1ijbqgN?=
 =?us-ascii?Q?koVRwZbOyhuMc1flKaeIY3ZJXFaiJakCe8vWphnVPgxfsJesd7+f4NWC3Em7?=
 =?us-ascii?Q?ruemUsKQNgwXG0DzYK61+zf5hMXR4hGUIUlAfVbo9PPrq8EQ4c2D6GsUdqBK?=
 =?us-ascii?Q?Jj44oKmhyBFQPww5Nv4EKViW7auTHZCLECAk+FpsJRPqp6GXFKGMlM1PPj8S?=
 =?us-ascii?Q?zez0fd9HLxZFNhP7KUvmys6mGYs8aprW/OcAImvb43h2VluijtfJqw2h8WKN?=
 =?us-ascii?Q?YqX6zHU98qRw+G+Fy2hl4EBYaJoE8GzrQOYdOVUZ32BCAX6pm5qsapWeB05v?=
 =?us-ascii?Q?MYGrbP/ynSIqLwkwf5r8yGRn/xGqxIu8v9CBHsq9AXWEAnHGlRMGJWympsJz?=
 =?us-ascii?Q?hlzDnY5WTyfsBienPG1Zz9Is6gOPleu4mcJQwRqube0jMojrszfDFHfj5cxO?=
 =?us-ascii?Q?p8mJfAOtN44BuY2iwo4mY/EgW4OgJgAWzvPwoxFMb4wNHiAYSOy07rUGBidf?=
 =?us-ascii?Q?0F9S6s4CdqJ7DtjKzh2aFH7dMo6yQkL4FVBxEce5eCCmAF5yuMtO7ne3vW8S?=
 =?us-ascii?Q?lRAD+UgEq/xYI2FcpY8wxj+79WvrmJqhuWnlmdr4FUphHfR+1IKE4HX6ld1e?=
 =?us-ascii?Q?7skANzxU8fc1aK/imxi2VjfkElcAsnr319XY4zzawDe/fPlolvt3UDSsoBs3?=
 =?us-ascii?Q?6vFKhhQFBwAjAsrihuOSUvB3bc/urMP4+ia8OGm1aw9ztY+mXwnTrAsyLapv?=
 =?us-ascii?Q?790ISwmIfvn57tqJobnQ962x0jO8OvFsbwHoxwgIss1tcxB6tNVZ9SrzU4gA?=
 =?us-ascii?Q?GpNcLXYPFN3BJ73f8wPr3Igj+J3dg7z+8OQPIE5tlM4nowYUDImWfu94kWe/?=
 =?us-ascii?Q?szzPfD9a3e0TrTNPEaryDPz2zjs2VH8gHAD+wVTiyovh6W355hGLOQengbXA?=
 =?us-ascii?Q?/2DRgO/lEUXjvy7eSu9qpaCHIyvlpm7pg1P92IBbUT+xYTMgMkDEqi4LVmbe?=
 =?us-ascii?Q?gp68v2hgiA+80zLbG7qMo/SAK+xmaoP6qIhwKvCcw+AIlfSoB4oH9FS/IU3b?=
 =?us-ascii?Q?BhEsBc5/VeNc/IEy2Dj42X/SVSiJeKyRQr2N8Z56oR+BsgpHjdQvbcu0xokl?=
 =?us-ascii?Q?h7S+gpOZmxKWL6s0lP6RUjOF4QU0obJe2FtN0ozNj0+BGitwjbV1/vyf1v6O?=
 =?us-ascii?Q?6XCRnx8YNHQBC3fvhosNJ7laE5/ulE/s0gqNWd4QE5Fy0P1InLq72EaopYKL?=
 =?us-ascii?Q?W534NnPgOqXUizYeg5mvPsBg55fpuosBPwcYSz+ivUYWK/dCGpVzkbzar80a?=
X-MS-Exchange-AntiSpam-MessageData-1: kVZqAyYCbjp6Iw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8744993f-1b33-4ab3-d171-08ded5d9d9ac
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB8488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 12:27:57.1510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJDQOnzcnhxwvAGFdmAp14pqDNt+MPyCaR5TUbupEfKL7j4N9g13pJvG6Qxo4oSc/mkcb8o3rTCoQjJCWknceQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391

--5z2yi4vowsobzkv2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 7/7] drm/sysfb: simpledrm: Read panel orientation from
 DT node
MIME-Version: 1.0

On Thu, Jun 25, 2026 at 11:39:39AM +0200, Thomas Zimmermann wrote:
> A device-tree panel node can specify the panel's rotation in steps
> of 90 degrees. Set the DRM connector orientation accordingly. Use
> UNKNOWN for the orientation if the field is missing or invalid.
>=20
> v3:
> - read the orientation with drm_of_get_panel_orientation() (Thierry)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sysfb/simpledrm.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--5z2yi4vowsobzkv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpCZMcACgkQ3SOs138+
s6EsRRAAkeLbeGp2yHWmmTsoyltXrU7QeQo5brXO75e2y+AVeW72y7wYplLvxJd+
nUQJS0D3tQ7vLHKSP7++PI3YAmPhauoxcfWc3tDi/Dg0dqc/bXsO03nLuRFx0+Vo
Kpduq5Uh39B7aPI3gKMBasr1inXMAGa1Hwm5AP+a00P7N+zwdcXlVWAWG6/pJxJ8
vG20LmJxtYSozLidCPoc1LqnJJizyFxhTAUBoAZtxImF6ffQqzjRptBsi7xHMQVk
xzPXXAaQrtsNqwCd6NVO4BFudrmFdV/zOdfNXVsZADc19hNQxpTaUCtjYp/NmASJ
4QbPfPrQQi4k5QReZFQNGQOXwziWDo10AXruTVnCmlZcF+R5XYsZIkOHobaM3Wzv
6kniPJp7CjN1HFaENoDD8InkE3Cgj+dr/ftVMMNYihZCZI3aurWppYZavUaee/nT
E5hNimCjPa8sQlIA9cvlwInTo2fOWAhLS6fgNINiOVWLK4peiNIzmkaJl2Z8eKk8
h1nK/1jTXrAAMjdELrd4p0bGHk+qsfqWmg3zni3LMTBFnvI69hVWel4SBriyhvNI
365/epUbxLnDT6ARzZPqY22EgSc7BU7VFbMKKS2WNzTur1fZpOK1v1FzSXIrB+XM
uLzJj6118Rc6lOJ+i+bVaFOuyVmeI5mzt2Xnvduu/gO94J+49e0=
=k4n3
-----END PGP SIGNATURE-----

--5z2yi4vowsobzkv2--
