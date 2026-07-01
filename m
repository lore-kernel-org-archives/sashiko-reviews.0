Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C2B367284
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922917; cv=fail; b=liZ/zi97uzjcsDnXqhU6BjrFmx55UF5t6LgJ6OWeQsQt4Mi7sbs1Ekf6VLbPiayO/gtc0c5tP5oGGhjREvMpog0mlGyZJwJliDjwz3s6f0qEIWiHoGOSTMTpeRZSEg1PKqFPy+abUfweprHzIeVd7LRZoQFyiI/uUShUyz+gBLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922917; c=relaxed/simple;
	bh=+JcBjzGTegYPFwLeP1YtFkgdM/8ta+NZ/QJdv1OF8W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uqrP9Wh20FXw2gyPM4PzqFkqz75r4o18XuP4RZzCCkF4qKMK/LOboKmisNkJtt7dTHqEE5xrTfV3LNSPHHvdivCqIQN69kBkWo7R7ml/Uuz8wydxw14AEwGgAwtqvb7JpdKKl7JyWaSTlxpuAKOTZFL4FECIbFx2x+h4BxXt68Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nEuo82w6; arc=fail smtp.client-ip=52.101.53.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nEuo82w6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcqNsgOCQb3tP6uXzFiv1rXdHxAibVFWIfULosifQdcR7g+QOw15USoK49+UOUaO7ljAfd+eV23qprVGTEkrVuUnDuyZB5AdxHCCoMq6EqOap/E8FK1DXF/G73ud1pggCpJ/ynN0tB1Nqc7Vp3UX2xyTHl1crAZnz41KjiaF1KElBexR7IVqKqOtm56I6TuEhP29vDTmFt/E5KOuxDIWYjFSErzzO8rF4yKkyJSrN7joV3fZB42AeHeVo2qPSnqg70vrrEYco5Is7FT5pFPvs3IR0HwhJjKV+WyveQtZZMBrJJ/Z7IuTgsVKjdXUnDpInnJjpCdi+bpIcEBnW616hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CET8Mz6euu6w+3O/juMqJgTKj22Z6fBqXulX6FLkLqM=;
 b=S6qMca+Ie+kXZseJKCQUZKLSm+H3OoAWgYse72jb9HAaqtdJlKn1Lj1eR0O//tTvXDtyqUKIiYjb/RyISUg/cmCuRxVmnf6xiWewrYViqbTnPEqvzAgPqTYGhwyE1Z/vVjsYweq305W9l7lmb2MQBo0CIBiGpbodUArTnOw9/qZd4hfm1vhOtSk4Fj4GvYBYixA6u/9urVFGDc3Y0kqZu0oNzOsZGGk0M0/tcPVZ80FFfE5CD+CuMi2I4g6ptUn6WTswJJbHlKl/aOAB763/x9UtP5ZbHTfI0HAxbi/q/WY/t1PF0hSfNULlzlW1meqLf3Clvlr6a0snebnf9wI1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CET8Mz6euu6w+3O/juMqJgTKj22Z6fBqXulX6FLkLqM=;
 b=nEuo82w6kXvXBDMCoasiMcPrxjOW+74f8v3aW4ZB0sDGzO+j14YjAslaLd6DuXfqFTDrPWgyrtP2qTzuqrlVDy2j1xK53oJ7X8h9APc5b8S4+0UiUpC9ecft4hhiZe8hjodIAYGFrtn7fry/LJusQuuGHm7OfWgp9mX8zw345hXSf/EE8Voq9bp7o/B4hkSm+ax9K7nPMRluByg8hJIBCqAv8VCsxQkboMgt+sbEtdd+Cp6L+OKW79llmdE75e1VyeFMDCS8+h0Yx6zbWoQdhkfS0y0Jx4uT2gc75AU2zTR1DeiadcRpaCKjzgidzUa7hm/bLCT/pAl7GcsExCV0Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18)
 by IA1PR12MB8261.namprd12.prod.outlook.com (2603:10b6:208:3f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:21:49 +0000
Received: from CH0PR12MB8488.namprd12.prod.outlook.com
 ([fe80::c565:c0e5:2c8b:c315]) by CH0PR12MB8488.namprd12.prod.outlook.com
 ([fe80::c565:c0e5:2c8b:c315%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 16:21:49 +0000
Date: Wed, 1 Jul 2026 18:21:41 +0200
From: Thierry Reding <treding@nvidia.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	dianders@chromium.org, megi@xff.cz, igor@reznichenko.net, mwalle@kernel.org, 
	dario.binacchi@amarulasolutions.com, jagan@edgeble.ai, laurent.pinchart@ideasonboard.com, 
	lujianhua000@gmail.com, agx@sigxcpu.org, kernel@puri.sm, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v4 1/3] drm/of: Implement drm_of_get_panel_orientation()
Message-ID: <akU-hXYt4tBKpMWF@orome>
X-NVConfidentiality: public
References: <20260701121055.192475-1-tzimmermann@suse.de>
 <20260701121055.192475-2-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sl7jxsyk2jgyclzk"
Content-Disposition: inline
In-Reply-To: <20260701121055.192475-2-tzimmermann@suse.de>
X-ClientProxiedBy: VIUP296CA0102.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::14) To CH0PR12MB8488.namprd12.prod.outlook.com
 (2603:10b6:610:18d::18)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB8488:EE_|IA1PR12MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 312e5e28-52ea-48f4-b506-08ded78cda4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|376014|366016|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Ej1bg+4HoYCLnixCWZv8BTUWH777FajEHIsZ2ewNpxGn/JaEJfB37+hc1FcyuyRo2rOw31hNBhiNP4RLqbHTgR9V44h7GY7PAKnS4BRSRtvfKPOoG90vdYySsRWb6QV6Q+LmvykAZgD+6zyWYB/i6RfmJUIYp4pzZlQtuOCcVyO2M4sHEkfP6AwoHhFAF51fWQhxypmbIZ44Qk10QYbQ8S3fGxFU8AEZNkPtFRwtNCJ1r/ROQG8tY3SkxokijO4vygVGBSELz1J7YgpCf7zwLBpWlL0FPxdRAv3c5GXU8rcTYLdB2wAbgZZm74RTvSdsQvCR3KYpmb7aQF7rc8LW9c3vxRfA6S0wRWCi7XjDZ0iHqCF508qKcZwGgElZlN9CNvKwaGrXI6daY2ARMPrkBbFUSWH89/4AaGm01icYwDsL+rgpStDL7kXcU+0C4VI9sf7atC5MZs7lFnrj4Fm1btrCIAiLCy6Hj+pog8lL6voq9SVcmU7f0TzT2z9CKc+vG8vP+loP+eKyCvf+f1s3JEVNc81co5yIuoUI+TnrjzZzUpGeAx4+JTP9dsJ4WAZBnJPH0p7XIqxhfpQKB4bEM+ZCZq0GVJJM9DXQCD0jCkdfneZQpri1GEf0gCzKtQ88bsIa5O5sEmxMilJ60LQDn8FChDaLFRdl6GvNPYArLmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB8488.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/sG4JW6ZuZL7JwjP6llV9f1JHOQi8UZKuRkL3cokZwQld/Dxzut2waUWX38Q?=
 =?us-ascii?Q?gSjumj8Dc+xxEde85W7sIMtlcpSOYkDGRI9Fa/sDWZvUrTDFwC2+OR8WgrPp?=
 =?us-ascii?Q?Ga71LaCh2cvSyApRti692N2gqs932n4Qpyy16HNyUucjevHSXxRtRM7vdibA?=
 =?us-ascii?Q?Qv/WvHqlIqo8q6sKVHrc+wGKfVHq/uR03rJ5u24jy3blbpsQ/K5VqafdJjur?=
 =?us-ascii?Q?GgguqIVb8bwQNY6GF3qCDYNDlaKjVVAZcy64oGhfP/5RdLlVmjxql5xIC58s?=
 =?us-ascii?Q?j9nx9t+gOnktX8B05rWEjOrM1mtQfbUz0HCfcpq6PgJZ4cR7BDQgRFq3PC6K?=
 =?us-ascii?Q?mViQiDl5/VQqNnt13u6mPCOxupIv2X79yn2b1U+i7e2uuzezFs45ojpokD1A?=
 =?us-ascii?Q?S8Qc7PNdJxpTBUv3YZxWkK1oipdGN3bIzwbEnLyap0S/GSFMcve1DEKJPA3s?=
 =?us-ascii?Q?SkrmJ57wuCsEVRHRCoedkZqvA8+HcqQvF/pUe2q3mPpmmSXsdZwDbrLLgd3S?=
 =?us-ascii?Q?7QhVxnkrrUZvPdGci6S/liNNhotljXsyV2CoOMJcLfr5htt99sKtIPjnLE/Y?=
 =?us-ascii?Q?ALS/HpUnIXzkEY4yzUIE2HxIDdMR/zHB7ovqMn0vUcdQGZFSQ0j5kSzfDpS2?=
 =?us-ascii?Q?ckTcYL7pKynreoAMLtYkm4ZqiKi7urQUc7ZPyzWOJp3/txAx8P9t3RY8ODhV?=
 =?us-ascii?Q?aqEuHUx3lv529caIazbF+1nFYpnLBuraRPTAU8B3YzpjOl0SNTvgRRdt16EF?=
 =?us-ascii?Q?x3ui/dTq9x5fUINsBhs45ipojbQGxJka0FUZefk6ib19eOMsXDw41n/QQS5K?=
 =?us-ascii?Q?oxXZ9XZDizslUnKrK2feyVGskhZGdc7nO62vmCqmiAHYT++VRB3Yc2UtzGaC?=
 =?us-ascii?Q?JlbjrJz1rj2gSEchU74GG31QDFtNkkk281kPfWv8S5gNyKZAP+eaAH7uDKOf?=
 =?us-ascii?Q?sg1bY4UdzDYCI7XrCikvW7/v2j8KaRMCZH/fQ+q3kQhBx76KtN7EOQa5KrmH?=
 =?us-ascii?Q?Agsi80vacoTkHOlWuVjoKUQNLUwtBS4AwcaiSdQKr6GcMGyKhwIC+1NO/8Vc?=
 =?us-ascii?Q?/qeKxfrCGgXlfRLhq12QsTsbmmAqAWcvjZyL1Jc+fyGsvnomYK1N04gfrsCR?=
 =?us-ascii?Q?/K3KrfD9qmqyyqym0rIr8vi6wPW2fqkq0yIj+2GJDtElrHvDCOyA+bUEzRDj?=
 =?us-ascii?Q?clO6XSCsUD/zA/RWvB9s+iB9QZr7OfnJOegpQTnd1O789++1HJmBxd7Kpvw1?=
 =?us-ascii?Q?rIwvt5n5LHk6Q15Rv9cll7QBwdSiC1OWY+7w8qXBrM+IU7Cx8xVMy6eIqMvU?=
 =?us-ascii?Q?9YNQivBNv+9KTXzqMc/i++NLoInc9IhDWmgkmnYHBXQLsi/ituCQbeIGZN9o?=
 =?us-ascii?Q?Fyv7xlb0oT+Yi22ddoLKVF1B2OXYXEzzY566XXa7i56cwCOMk7LrCzT9HG/r?=
 =?us-ascii?Q?8C/QC7ojxYRb3UebKbfCbm8D9mJqrtrHYCNHlzU/W/eqKsFwGHG+tjLfiT3/?=
 =?us-ascii?Q?kokYYmlr5AgP1rHM/2Ch2e/nFkrSGisJ1Rtlss6Zg2492XXtUxxVGiJJushL?=
 =?us-ascii?Q?Mmhg60iE5TjcpHoPYixnfwd2blcX39hTkSjRzdoKXqGDaxrMdoo6nXRKk/8j?=
 =?us-ascii?Q?Zt+UJ0FtkNKIGrZiD9aF1QANIKbV1vI7kQLU9iZirjLn9Ehj+Cx3kpVoBpLE?=
 =?us-ascii?Q?L8cGfhgtvUtAS1h/CXNgktQ33Rwv5Pep0DQUJIGEpfE8UQQA7HBTzsTJ1HPx?=
 =?us-ascii?Q?NNUjlo5WKOO6nhYQ8phwJFeQ5wpnfMT2WEorx6eFDB8zE8KpRAoUqB1+A9KJ?=
X-MS-Exchange-AntiSpam-MessageData-1: SRzsNj7UXhFvew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312e5e28-52ea-48f4-b506-08ded78cda4c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB8488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:21:49.3315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jP7+/dANe+t6c1lpa9QPtSaNesaJty3cPuE8u36sQs7P1wmzucxtTrjoIEYQMdPwU2HouWbwhydMbAV+YGg7IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8261

--sl7jxsyk2jgyclzk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/3] drm/of: Implement drm_of_get_panel_orientation()
MIME-Version: 1.0

On Wed, Jul 01, 2026 at 02:03:18PM +0200, Thomas Zimmermann wrote:
> Implement drm_of_get_panel_orientation() to retrieve a panel's
> rotation property as enum drm_panel_orientation. The code has
> been taken from of_drm_get_panel_orientation(), so convert that
> helper over. Callers of the old helper can be converted as well.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_of.c    | 44 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_panel.c | 26 ++--------------------
>  include/drm/drm_of.h        | 11 ++++++++++
>  3 files changed, 57 insertions(+), 24 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--sl7jxsyk2jgyclzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpFPpQACgkQ3SOs138+
s6GbrQ//X631pXvMQ1QRygoGfnRKb2JvZxpamGWuq5g/Duqb9jfkdVVOTlVanPXT
mHuQ7ZHBJHC5ru9gX6XF50ksi0G3FJebx8u0T99aojSJXwZY9zD/cBsQfSYRN9RQ
Jn99qmK2TzZ6yod3fy4NN+s5kSLgx6mehlulPr2nTMz9bqOGN88T3BAIIRrjVtFX
nUXTmEbNoOio8gCAS5DCLKS6ogS6umDMDDI4oID8p1+AJX4sYSRPMCTWzTvOvn8n
cAYUnNsJAehRP8oyWtDzbk/qpw9o0UEq4YacWaY9g70Q8HzeFMG5Nn/OOUUynANB
IWmNmZvSdtDzo3s4QOQvo9MsjBLL/v4CvOO2KOl7XRULMYnrJRk+rLXcMx/okgRa
P5p/7XA7MUaPVVZNJUq7QwwJ06M2qVL9GW6Hx/ypMlbnAWWkVZK+U1iB3p88d6qS
nDwqpEswoh+N1M5ACOuQZpz6Hs2zvAELTh3XdtSveZmZ+ZR/uqBDIoWsuBHkcnt4
uUlxphzQBZa2hpFp0iKCkSask6yjr3TnFwWWu/w2jkM4YjJvwyro5UpQc/xdkWvh
OngWk0oEzCW4MfwTvgDnMghLHwgJH08AxBpHIcJcq9O9+CTX+twRXhl4XMp5Cp2N
NX+Nlj0pDyY/2APNsUWy0BsGjtLywNKytaXqFP1A1AV+4X1ogNU=
=Wd45
-----END PGP SIGNATURE-----

--sl7jxsyk2jgyclzk--
