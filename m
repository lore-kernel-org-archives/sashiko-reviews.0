Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010069.outbound.protection.outlook.com [52.101.84.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8EF2BEFFD;
	Tue, 19 May 2026 03:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779161020; cv=fail; b=ra6h1m4kS+SfZtf5iihgfrtcK4NP+VcNxmCqBPwCP7eTZstgNZpZ9aLkVWAWZFMsbCVCMo1k3R/16BKA33pfW0HtKOiYoDAwlEaQlI/YrIQL566yvGMlL00AW+BYKYkx4KIeENMo3ujF1K0wZmUlKw32aO/ldamp/5vmx9ss4hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779161020; c=relaxed/simple;
	bh=RKWZ8/31uSEZTjq+O1lpIqHECI4Yn+MS7r2WX6pX1zs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KCB5GdwnWqFu6F8a3ZTzvqj53XbqES7TwIfJZex3v8eVyYVsIfJpLZB5twxvL5CLTx3Tr2ArkzfEDMPJH6zUAiceg92DeS5xUIPHZ2VVrQ8XZwzdUcq+6of1TcJea+qL/WQ+ovb9fcmJFiJizully7sIOJ7pP6ZUhaMq8JK2DWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lpG0VXwC; arc=fail smtp.client-ip=52.101.84.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lpG0VXwC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiyM9B+YOhQESw5H8yluC8nI/RYymO5EymaVinNtX+5bAawFRNVA6nuRxXI+qoRYiXW2qgaG+s9ah8wpgxn4qv0sHXV41CKyG0JD+JiW4kvzUaapeehNc06LWCb3wCAwrahGtwK9NY3joXHPgD+VnAWayWYxmXbKDF9dXbfsa28h2DzD8VEc/clw9xVCnpxkzw8lWUBwIULiRhuR6DLHeY0HSWLi7+LFMx1mHHCJA07BuCErKgaM2FLZ4O9RyXntVZjrBHAkQ28wHJ1JzG25ol85a8ZjsUVIjqwhzQ72iVkyZvAYMzmwCtJ3eC9TNdOwqNN9GpsNbL78oW07BgWTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKPxHznZYmJW+jcEGniI5eiZ2FQVoq5JtSBKVbXbiy4=;
 b=XNe/oKi77zdJP8QX7g2E09v3unQ3VngtD7OYtZAGXrSGxKsMSlj3feYIZv1N0z6K+GoeGvujei/MIeOIOumkITWJzoEc3yfCQPl5ctJCoyLhsGLSzy0XJLrWMtYygBrfqrf4DHZtppnGLiGRJcX16VIrfUcyr3ublaK3fITlIn9hBkcGyLSe+ZjCy9oBWAU+hxTLjjVuFEG7+r7haUOi4zcHkYnIf3jpFzwUsv6cgmarrC2DZ7/V19QVtfxhemwzzEvmbKtTVZm6Dca7g1+dAQ19Y85u8kQEmIqbq8lxDtLKLYj/afHzdkdKJqqTOPx8PuYtwt4mLnH9d12t7Pee7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKPxHznZYmJW+jcEGniI5eiZ2FQVoq5JtSBKVbXbiy4=;
 b=lpG0VXwCwQBysW4yD+ccG5KxF5fRemdAex9XEcQZSMcLXu/3q3Y8oJQ1N+uQqOhMRKgiCsJyzWpqJ5F7ytob22YR7UIpwjDcWfL6ndQsPoD+eGjnHybhlgF6hthj+sqsg01+08xXFsPjsGGkJKxTZdXRxDenoCzimBWBMUE6XZk4qvZTXUT6zT+RDeBfJ0fUnLttU5D7mOiIEG7wX8QLXrlVw7SrekLcL+MlgOkIXyMb2aFCNC2h667vopkUh17zeQwoVxItK1g/m/ednCUX62TzpZs+cIVa7enMUHKxNDN6mNQU7b/Q+RLzga/Z9cz15KFoLM36mU0X2aj/pYdNFw==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by DBBPR04MB7804.eurprd04.prod.outlook.com (2603:10a6:10:1e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 03:23:36 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 03:23:36 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH v2 net 5/9] net: enetc: fix race condition in VF MAC
 address configuration
Thread-Topic: [PATCH v2 net 5/9] net: enetc: fix race condition in VF MAC
 address configuration
Thread-Index: AQHc5nLhMUF/EWJG2Uuh4aFJ2thSmbYUq3GAgAAEk9A=
Date: Tue, 19 May 2026 03:23:36 +0000
Message-ID:
 <DBBPR04MB7500404B43BE9278EF55A66E88002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518030535.1057228-6-wei.fang@nxp.com>
 <20260519030413.8C2E1C2BCB7@smtp.kernel.org>
In-Reply-To: <20260519030413.8C2E1C2BCB7@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|DBBPR04MB7804:EE_
x-ms-office365-filtering-correlation-id: 8c8f2ba8-6df3-4533-6c46-08deb5560379
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|38070700021|11063799003|4143699003|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 RodkDsjiofqmpHqwazOV/454ZsRTB7fiIpERkD5vJz2BuXfTqo4y1bS/+Z7iHMkobThc+5aw6T5k+04C2kTMgEDrnw1T7bLWKWxzlB+duLvtbSn6O3VmD8IpFhu/78Ms+lJDi+be5+czrEgoKn2CKyS7+A1dueiWc/KlFJN9zCGewEM5H8srZj3vhw9ZuSf5Wlbqf0OEUtVwtplYT2SyKu8XaeJsJhnsiR2uHE0O7eNgkWgmTxtOmeixItEUyUBYcWdgc12TryNl/7H899ZQBaELOIx3aFwsR2uPUwoLzPTJC+JfbLZg/Hh34kmaqmVDDMFca/2NVy8C36aWl1Q5oCGjrsOTcVEL5Wd20buFB3Vi3Aq1fJaczQIjokrlcQ/JHNMpaEDgsrlS9j6zgGthgZhYonQUJ0t16svEnLLk9uv04ZXzo7FCz9F3kyBXkE5RS8JWaTfbDhDwVdaMpdEJjWMsPkAVb05rrtoUKi6nfbYH2g9GX8qaS3b7JGDVF9feaJGHzPqzAuPOGeO1px5vsHHRZ3Tz3910tktwifB48cmw7gw4J8ofoL7hnmFevnMguGfTsdyWgf7c6xKRI85cedFkY39bmvqFrEXJPBtpsvgDhZve//RV7QKyZ6uhwfoscewOx3l4CD8kmJ2ArhXr4YBM2EiDTlqq14Y/vshVF0UvBBkgI6X5grxbE1mYcfX5Wpzmiw/Dx4AD3x42njwda0ThfzurZr6aKV5G5LW+LXVOgsuZ8O6giNEudgEE6RWw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(38070700021)(11063799003)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZdR0NAVUgiEH6XwtRGfNmahYUDpJa5cfXtIzbWLLmH2ZcdNkXFAVoHglquWy?=
 =?us-ascii?Q?RFlq1As+0Lq0jPx+2r42Rp64RgR+U0fFa8D4Hn5hejeQt3fCN88HChk1t8kl?=
 =?us-ascii?Q?Zx/rv9NMKiwl1IYWKdD+S0K7JJZGthyFLvoMWZ/G+OAD0FeUxNF8QtHjHAKx?=
 =?us-ascii?Q?h3R1nCOoNzMrWomX4rDMKW2E/hWSjug6EEmDbTkNHe8JibZ9KOSo2g5SFuar?=
 =?us-ascii?Q?euLodq2EcwrAcIOhrSF6QnsTo+cdWmRenfP9MV3O9w7+DFWvjsscy8cJisNa?=
 =?us-ascii?Q?JWvYTRRohSwZcYafYYgfls9ATfhRxIb888gOZcPEd9mf8nJwgi3NTgmLdWQM?=
 =?us-ascii?Q?mAi37SlfJAXMeB+OufIMe+C/vyueGE4XjnYirqZNxSTFPM/kJkUnH8bU6p5Z?=
 =?us-ascii?Q?Rb8oMRF798GtdNAHH1aRJq5blyXDFjUrfFKg1gfoY5mz+2Xz8I8XugFabUnv?=
 =?us-ascii?Q?x5y06G0qIdTKy3mMz23nGfxsAXM7hSSGd53cmO6JxOUWGNc1Ig55R9U8u6AG?=
 =?us-ascii?Q?eFpnZZ+hcruSjFTEBEe7U/TnNTycw4xXA3yktup6Mj6sN/RGQM+0DEMazdOH?=
 =?us-ascii?Q?NYphhm2hur+AbNM3XskJH91Ix+CvjLUc3L/ydGvq+Uw1JN1gHoKV1lpRY7DW?=
 =?us-ascii?Q?2rKBJwHzTC/7AA/DcRSC2lBX6SAp8vaPkKKuZaiAoyQtF3jwcYcgHg9u9WBS?=
 =?us-ascii?Q?P6Jj1a6GWMow/NYcz/o/CtyiFyTsyzixryJ2OUuK7npjIlnUIJMkyOp53a8c?=
 =?us-ascii?Q?FVMt8lpDgKoc6hsB1ymh/RBAoa6vqBWywuNnbsuiwRkUN6dz+BOIaE2M/yqc?=
 =?us-ascii?Q?+4CfBWwhTYiojGnlYokzuK/OAV2VJcng/Af0+2eF7iSt4S6i9HWy97MW18Eo?=
 =?us-ascii?Q?3PhLIOSUxumLUxGaRj8D2Ha5UULyB0jsfvkV9OeAFJkkLZ6TQlErfMHCRan5?=
 =?us-ascii?Q?DR5B6pgwpAOYOYxajxGEOzLrllLJm0RHH73uITAfTmjiYu+z9IsoxA91qzSZ?=
 =?us-ascii?Q?NFfmz++U+8Ts5+fsRj5FzrsBHU0gD7tInzUYSbUmm8i62n/Kt3PsJm76Ozwj?=
 =?us-ascii?Q?3OlsKTNZ2xSEEDXmujw+JPhyvZHNfh/OP9vCtfmOzkWTbK0jq4fg7NS/w/Ug?=
 =?us-ascii?Q?NlwVJDwWCbTS0B12kYVk/jgH3MDADTNmp2m2nw6lPyxkhW38iNq+iwdtZX/r?=
 =?us-ascii?Q?OS2rPcDXe6uzrxBEnz5xQoBTXvhQSAmW7IUndHEX9mB2bihzP2NNLma/ORck?=
 =?us-ascii?Q?h78lpgHjkKN+UNFwKCWNekhwYd4fMyqiWjyHP6lNydC1MPrcQ933JZLq9XkJ?=
 =?us-ascii?Q?nO9vJQbcUkPH5chjio3+2Va2+gl62QlUZuw3Wc7vOFQA05Uo7hEOSOswSwNe?=
 =?us-ascii?Q?5f5o8C3KInw4VmeWYG3R0jaXbbyCD9nxuUcNJ3x+Bv/+WNabYxcavKDd3xXO?=
 =?us-ascii?Q?Wx7xzLdY3fk7VCXqu8Yd79tj2QsOCSBWdyFMkEj9W+mVrfHY3m4VFL8/zcNU?=
 =?us-ascii?Q?TgTW5PwQetnj+VPm6sICP7sf5itGbsE11ZxTtJrsUIgF2NVCUlILTMaRtdiv?=
 =?us-ascii?Q?Ck6RrU7Wg2ghMzcbM/edQ3Jh5+/f7kHoebwwtoYAgwSZRKJocwtEFXYOqRIH?=
 =?us-ascii?Q?HW47YqydT/CvCvKymipQHymrQWZDmPRCn/ynGf8+tbfdDy9I85WUVZlNUctp?=
 =?us-ascii?Q?2pAEPIjXs0l4peizcUTv7mnOkN6Se0bSuXf972B0Dk8MtFOV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7500.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8f2ba8-6df3-4533-6c46-08deb5560379
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 03:23:36.3146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W5pIifLGbYAlQ2v1oy+i0hg4tb6PCWf+A4lZjOOLUEdgu+7PU0Ci9j/8mdG+vAemTXb0Pn2+0fGpYAksFnzbxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7804

> > @@ -989,6 +996,9 @@ static int enetc_pf_probe(struct pci_dev *pdev,
> >  			err =3D -ENOMEM;
> >  			goto err_alloc_vf_state;
> >  		}
> > +
> > +		for (int i =3D 0; i < pf->total_vfs; i++)
> > +			mutex_init(&pf->vf_state[i].lock);
> >  	}
> >
> >  	err =3D enetc_setup_mac_addresses(node, pf);
>=20
> Should these newly initialized mutexes be cleaned up with mutex_destroy()=
 on
> the error paths in this function?

No need.
In enetc_pf_probe(), SR-IOV is not enabled and pf->vf_state is freed after =
the
PF's network device is deregistered, so the mutex is not held when freeing
pf->vf_state.

>=20
> If a subsequent initialization step like enetc_setup_mac_addresses() fail=
s,
> the probe function jumps to the err_setup_mac_addresses label and directl=
y
> frees the array:
>=20
> err_setup_mac_addresses:
> 	kfree(pf->vf_state);
>=20
> This leaves the initialized mutexes without a matching mutex_destroy() ca=
ll.
>=20
> While the memory for the locks is freed alongside the array, missing the
> destroy call bypasses lock debugging validations when kernel mutex debugg=
ing
> is enabled.
>=20
> Would it make sense to iterate and destroy these locks before freeing the
> array on the error path, and also ensure they are destroyed in
> enetc_pf_remove() during normal device teardown?

In enetc_pf_remove(), pf->vf_state is freed after SR-IOV is disabled and th=
e
PF's network device is deregistered. So the mutex is not held when freeing
pf->vf_state.

It's pointless or unnecessary to add muxtex_destroy() in the teardown path.

