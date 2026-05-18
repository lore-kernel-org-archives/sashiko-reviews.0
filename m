Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B03F1E25F9;
	Mon, 18 May 2026 01:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779068348; cv=fail; b=LoPxrvZkMD3+T2m4yfO8vohkbRFaJ4klpf/e9SIQCNWAfwGn+b1VOovD0THnKkkhGPa16LqwqLWH6JPjuMyLrWBayaMAAuWwD3UElp/16yu9INVRI4XIPsdDu9WeydqlO3dSs4WyNvvDs6Q/dWIGiLqhFzfsHX0snrKqyna8JCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779068348; c=relaxed/simple;
	bh=p9OoJg3xLoYVmuU3aS5ACZHpftvOb9mdiMYQTQ4vqQQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YybOuoVow33+tBa56qPewzGSq5z3Od981lkJtXItgxkPIxfVosCNuy/sk9S7mRCOO3h1BgJ6p+5soYcoQ7Esk+VliaGkowSbA70ckkNoRRsCibpmBFM4S+DNOXvfBUHiKwMAoLPpBXYDgR0jQ3FkTSprzGKwCWo8I9em0sbMhxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GhxtMWfQ; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GhxtMWfQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoG+MCT0/mSfsGX4s+wf0oef5W48Zy/c3NTYv1e9jvUVgmIzcxlb+zkoMA38fER81cavMtxfT6HHDTIM65Q9oSbMqr0mkv+SY1tsnACErP4aZ67z8nwddZtyGr+bC/zUTr0CwD+/3ZTHqzX+Z5+ACLThU5uxubV/4r1LIHDJqbBFZv0mRtMBPa1J8neu3EQcgmy3Uh6TYgh0MfN8x/scZfKC4YhuxYGLi8hgUU/rZdD6yisqy0Y+hoiLJmefzBRZPnKQ5qQ858rYKazJie76U4jt0q3jCyRr2Mu+uWO6GRgnbS4hdPHE2QBQal5s7JUYmViQPZtt6ttxCMcw98V5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0DN3xkUsRA8cs3ANqh/H8xb5I1C6CmNs+/ZmpOHQo4=;
 b=eXgdYwZSvCgkds0mDNwMNh7HF/adyX7iOzbani11gzHgUef/1OMjWfRu/DggJgNBQxdMRm6l2LiBUlty/79HsP75eW80PxTtru9DNC77tLoVl9YRj8Hy43H9L+tjNfNAJkW/8iCrDON3TXcVeiQxZHtWl+8ijKMWAMRF7XoVrCffMUUnuE6wDUTqr5tB+cj4alR7z7+tl9r2TA3hNU/AYcGn3Yb7yTvxEMKyklegMFRH+eIEOiNTzG1ebYQ31guk0H1VQtjup8Ulyd6+DYXT+mAVeEWkncPxKL6yTXP/socHYek5Qjjz1kMMhA85sKryZSrsZKWksWgsLrdOH/zW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0DN3xkUsRA8cs3ANqh/H8xb5I1C6CmNs+/ZmpOHQo4=;
 b=GhxtMWfQxdfwMad2euW8lidTR3QAlX2Ygpz06uCTlyXaPLSWcua6IYY0G/e2j2eqg5jWz+PRo9Ro96zMAYPqKGdPiTsXprkEI6192/fP+3pCAkDdmwrhu5Yz8k6RGzhj1RPVpsnXZsYA0mkFz0M57KMAzIvIcAfIJGs/Of6sIYyMKA2ex7CDKekFGTZ5BdNqbHbuePc7FdkFFEKAC2w3KPioyIzfvxA0w7Hqoxqgj0qeIUhM4ZMec1n00tIVpds9BAsUu0eukK6PuJCeFc1Yq4ARB7ZFWPRj/yY43uNYD9FMVSw+03a2oJo5uBP3LgiML+e9t+fT/pLWpXThG4/1CQ==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by DBBPR04MB7498.eurprd04.prod.outlook.com (2603:10a6:10:20b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Mon, 18 May
 2026 01:39:03 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 01:39:03 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH net 5/6] net: enetc: fix initialization order to prevent
 use of uninitialized resources
Thread-Topic: [PATCH net 5/6] net: enetc: fix initialization order to prevent
 use of uninitialized resources
Thread-Index: AQHc4sc/P/fEYN5iQkCsSP/hcHEdGLYNW5uAgAWsQUA=
Date: Mon, 18 May 2026 01:39:03 +0000
Message-ID:
 <DBBPR04MB7500B00E7D74B487947B85EE88032@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260513103021.2190593-6-wei.fang@nxp.com>
 <20260514105823.84AC6C2BCB8@smtp.kernel.org>
In-Reply-To: <20260514105823.84AC6C2BCB8@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|DBBPR04MB7498:EE_
x-ms-office365-filtering-correlation-id: cdbcd01f-d3ea-4dd9-8529-08deb47e3e0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|22082099003|56012099003|18002099003|11063799003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 pEmEd7s+KaPvtVRQaX/5nUJ2zA9NfIkdjYOe7S6Dd7kjYSSS1+gcf1XB2gQOBJJkCYXOOJRlnbgRMg9Ydo3sZBL4Vqh9ohWt6rZyBv7xfoP3acT0B/POpueOxMBbAmYJ4aSQ3phAwh6X1Zoee3b+3l3kTWIkq3RbYxzQ1Ior4sIrKcXf+o/b59bKjceBc/MU+KhpEKtC1AyiRUWjjIlCS0xVPZ/Tku31ZVefAN1aPcF5XKb/ypks5ghgxfQrldi+QFIfCtfHXF/l6dUqBiK7uPUR84SQ8a8MEuktp+HaIOJBENFoM0yP2Agn8cFNkdtfS/V0bqO1GzgHZY8EuW1wd7gP8+GQVs+t1Nm9klz5jtbeqUSVM6xMA6JBma7sH50zZZz31Sx+1Z6luZ+S7dLKpYOSOf/1N1989kqGM8maqva1iHrGWdA1Xkg67mSB9x4w3agSVb2AFydnWabDorlzJLb4/35WW+rDD1giMItacBnzN+lglQRrjzcK/3qTYwJJpAppIUuoE11SeQc2njKQ4tY5v04q4T1UIYVBDAx08VqveO1Y3xW3VXXwQNuzbNIiVVmYrAgq9vjlF1z2yaCAnk5meN6LEdTs68DTkQ3r34SZJ4CDgDMJ7ihM4Wgl5CbtOD1SfoNvaIionFQJGfsgU0hDpEB+ceN92Np88YZ7wuk8m0QyD5I3qpmCa8mfXEsqDSz8byWjT5mCWFfxVuXZl5TKFubQvrxqgfW6q2Ih2YCVCqlRwNkrLouWCJeg8Hbc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(11063799003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PbJrd9uUH942L6y0KMr7aZrwzUe3THMbe2iv6aM9iuKcy2Uzlti51dGrnQK5?=
 =?us-ascii?Q?Gx/b7a8jTg+38jFws4VeLka8dx4vrSYsQ5CIbw3rnHdliktkgzKTivpb0e62?=
 =?us-ascii?Q?4iQHxpF5qUynphYM5lAi2YvwdC1DqgcEU7SkZbkIolkCOpZBAbqXDC14DPjN?=
 =?us-ascii?Q?BARDEyGfD1CBM4MQSeitzvkd72iRUI9D1lnaWM4Oui9jIyKIgGhncg5QFj5l?=
 =?us-ascii?Q?+ubpQCk5SWDMGlOkbpJ6Lg7TEGi46aIFHs5Emji+PdXmlx6e/PCU/7fb6tEL?=
 =?us-ascii?Q?pj3Apt7ZiavkQYJJTp0ts1dHJNF+uzxjgUzIwkhfZZR5YLuEeKKh4TzUltdY?=
 =?us-ascii?Q?qS46vYSE7E4XuafzP3QPSbC97EjIruJ21GJAIDhUe4UsjZCLv/QeI3lNC+O1?=
 =?us-ascii?Q?i17upI2mgwLzen9MGtm65ozcTeaeCCjAG/b07mMK6SYzVOBOUFX0l05sCHhU?=
 =?us-ascii?Q?zp8kb9Unl7IpXnCXTpS2GJh5yXOVu6PqNz3DHEgJxHK018vlZ6swt1YTairD?=
 =?us-ascii?Q?F3Zr7VLl6EmfkRumtoNHUdQNtu4c4BaYK8Y/Se9gHjPodJESQIanRwCbfo5A?=
 =?us-ascii?Q?gaBFK645vqhIzTfnyWDQfYw6GTtBESSCDLwjRLwwXwkz83AE7NHHy9i5PxpH?=
 =?us-ascii?Q?M48wX1ULjEednjiXSvoofjVcR0FytxtjyhYykl3iW7RnazSDlXWQp91PrsG8?=
 =?us-ascii?Q?gmGksa9GxoDQ6WzJYOlyv6HxJgAD1pTWawiOf+poArQ8qo6RnoSbaJBDYfLY?=
 =?us-ascii?Q?bAP+o0E5wO7zjuWbugKZU5y3IIxuAk2acFTe1eSKiDqZ8ZkNwKKhQx/oIHMW?=
 =?us-ascii?Q?KukbiUVt22zIgUMfmCAH1XyWYaKiD9dLv54e3VsHzuFPxdFlQrrsDRCDXta6?=
 =?us-ascii?Q?DtX3aa7G6XUtqKzv09lYRNJoXmRvsXoHoprTnTVC4y7sFzPEdFhdMik55fmn?=
 =?us-ascii?Q?FOCQwCWVRnq05wJ/WVcraM/DZ9qg+zxJ3lEagzz10rZ2RChtVeXWggZ6AbjB?=
 =?us-ascii?Q?BmweI2zRnXjujGjfi8TnFqEf8TyUBgfJFerpc0Sk3S5IlputwbwwLSOahjr5?=
 =?us-ascii?Q?oOUX6Ylc2KbhXdkHwNvkafZZynEMTqvQUXDOJjW6mLV714iKzSPywlS4F1mY?=
 =?us-ascii?Q?9dp055A7hvLqiSpeJdIHEdM9ka77/BaX+KUJLYHr9YLNFeFf7N5Srh/hGVdG?=
 =?us-ascii?Q?FPW1yMGYXZ55kV0/12HG+rCA7AIZeAsJTKVOKtH7ji+OLtPW7ibaOYQLBFFl?=
 =?us-ascii?Q?CvBj6ZLgChQDTKQ+xSCNYUmJlPh+TUAgTjwpaviEC/M6j3U3F7KOomJOcimH?=
 =?us-ascii?Q?nNTpx17wRQAvH6pm0My1Ggg9mJ5sScETsveezFVFyNUuGEvbwaebQt9pI7wO?=
 =?us-ascii?Q?BTFhlYTntT6F/hSC4LcjdoWewAgtt5TZaXf598/E2Uc1RiOviuQ4cZQ1BVqv?=
 =?us-ascii?Q?87QItVHl/WhTZlq2MAj823iaaRLgeGHjq1fQvBWPwK5fPa5YELS7SoSNP9H6?=
 =?us-ascii?Q?jHRMGO1qMt5GIGz0zOj15baiw1l+OUZV39OtpiOVwhzq1EmWMCMd3J4C9UDO?=
 =?us-ascii?Q?zhcuTeHmVWlVd0zJgnItFAA6F0Dcta4jSL8XyRj3PLQRS8NsPT9GaZtS6h9x?=
 =?us-ascii?Q?lwSAhE8/i0RF+orU2KaD6HXeWZBlkqHv2UHqHy4HBShmX6I9TjXuv7jDhkOU?=
 =?us-ascii?Q?iOZCp6LvncydS2RGffDGerU6Sc3TvJI7LAyBCaMbPNUlX2mU?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbcd01f-d3ea-4dd9-8529-08deb47e3e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 01:39:03.2541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilOhUXCl8SMIo0BKtPkHnjvr8I5XweYrtp8mNSIbySQgaN7yFFMEpWkqVjjda1waif1ZqDMmiZxvXWBsOU8rng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7498

> > +	for (i =3D 0; i < pf->num_vfs; i++) {
> > +		err =3D enetc_msg_alloc_mbx(si, i);
>=20
> This problem wasn't introduced by this patch, but does the lack of bounds
> checking on pf->num_vfs lead to an out-of-bounds array access in
> enetc_msg_alloc_mbx()?
>=20
> The array pf->rxmsg has a fixed size of ENETC_MAX_NUM_VFS (2). However,
> pf->num_vfs is populated from the user-requested SR-IOV VFs, bounded only
> by
> the hardware's total_VFs capability.
>=20
> If a device reports total_VFs > 2, a user could request more than 2 VFs,
> causing enetc_msg_alloc_mbx() to iterate past the end of the rxmsg array.
>=20
> This out-of-bounds write would corrupt subsequent fields in struct enetc_=
pf
> (including the msg_task workqueue struct initialized by this patch), lead=
ing
> to kernel crashes and potential privilege escalation when the corrupted w=
ork
> struct is scheduled.

Current implementation only supports ENETC v1 (LS1028A) VF, which only has
2 VFs, so this is not a problem for ENETC v1. We will improve this logic wh=
en
adding ENETC v4 VF support, so please ignore this.

