Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410DE1862;
	Wed, 13 May 2026 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778667612; cv=fail; b=L9lEH/jf8EKXtkbnZPE6m+ubcn+00iHNGUe9AdJuguxBhYvTci70p7c0zmQ76n5QcDGWpMS7RgTj7lirJcNp1V6MxlcYDpXNqudSAf5JhYSecLjoQAsEokR1iayO1jw5VI38gY/ACEbiKrMMCG5WPu+fWMHdfyUwq55jbwlegck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778667612; c=relaxed/simple;
	bh=STWNQ2/5v2mbjZKuyshMskXRI6SXupxteOpKlxZYh68=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pUsk5w+ZihEp5XiTGcL1tqEg2dSR00Gp/o8F5NtOpQX5UgNlr3/KBgfoGbPLFg14VYucvyILxL63X6xB0hq2r2Hj0hzJLB0OAX+uM+rCdn40cOwlYcCLh4NawYUFpv0AG6H2WztsCzoanNTwmJJXG7jc7U6HFcPv2OaCVeu0nE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kr2C5dWI; arc=fail smtp.client-ip=40.107.159.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kr2C5dWI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqIrn6N05XfJoUz1rC3NfEVJLa+sqIKMEqF2OS06GbEFfZ82zRu34xfK6mY7I/Y/iosI6B1RtmP0pYIBPxEZOp+tWXwngCnC6/30yPUjezMjIiZkHXn0n4LERSF1eTb1Ap7zNugJ1Bqvkdgx1sjIrA262XrMR2Tt1JSmv1agRmzNGPlVzUskP4qyuCEiVluuH6ONVnAlwhF+WXAH9aU6InP6RBRdgnNQxOs5oK0x2pyqtC5rApF7J4KCuaE7btgSn281BaiPMlCeOmjiFmKykAXwtuy1obk5HSEXNNRVYJORz/gUQStZBBy1v2BP6T91hle8ujBdE/5Muqg8tlO+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FiQdKFq1KWGoNZx51SHLWvs+Q3NGw6q0vEKeyz3j40=;
 b=mZW7KPs4DTuHsEDTsvSuPYT9oHobBd1EtWazRoVSV3Va6X+Mp+yo+7F8r5f/r1sJ/AbT5XS24SVoqt4BtYJTPIH3A4jnRZbnVwpFz4E6MQb3RRkinMr+efd+055zO82JnV8lcuB9gAIvXzU1sF48Mor8i/14WH4K/hBg5zA6XANj7USckmfMaVXOB+7GO4HDxGWFkCMxxzyszw16hiJPAwVYKzpCsD98HMhCa36SmNyVI8UP3sKe3PCgDC9ue7Md8NGVuwVdTWQ6c25SA7fvesZK0h9zvcyAz4uL5Iw2cr9blq4DKzn/kcBuIM32syrpvRRYv4OwSqLzhwJl5Wy3qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FiQdKFq1KWGoNZx51SHLWvs+Q3NGw6q0vEKeyz3j40=;
 b=kr2C5dWIWo37yuDJYmZgJ16j08yBcy2nal08+UNHhucPelXnqV5Hxv9atKHjf+hcUQ6EqbkFsGAuvpPgTRhxCGIrH4AHBWgzlzYj+IpSTDVnL28UqzlMJjPrHeH6KUciIAwZZFLpjLTYse/CgBM9LWnI9o5kIjILmy1FT0mUSzmeKrjSSofqnB7LZ//ZTp/NccFXJCTa/l47eLwGYNRKnx58cMWuYFQPPGBXQOnLvN9xy8bLJX45aWZ6BWCqnCrWUJsVWLgT40uWa4nxXUyS/0YLaBFvLBGyMK/HNciCA9KZR6IJOaQD0DExd9wa0KI2k2vWejheM3jLQUpKgJDXCA==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by AS1PR04MB9288.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:20:07 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:20:07 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH net-next 14/15] net: enetc: refactor MR interrupt
 enable/disable helpers
Thread-Topic: [PATCH net-next 14/15] net: enetc: refactor MR interrupt
 enable/disable helpers
Thread-Index: AQHc4SEdOPcSNLTUxkiVWFYCUw0m0rYLDYGAgACxvyA=
Date: Wed, 13 May 2026 10:20:07 +0000
Message-ID:
 <DBBPR04MB75008FAD0FEBD66313536E6B88062@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260511080805.2052495-15-wei.fang@nxp.com>
 <20260512233431.A5B42C2BCB0@smtp.kernel.org>
In-Reply-To: <20260512233431.A5B42C2BCB0@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|AS1PR04MB9288:EE_
x-ms-office365-filtering-correlation-id: bd925709-371d-4ba3-9546-08deb0d934f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|38070700021|56012099003|18002099003|22082099003|11063799003;
x-microsoft-antispam-message-info:
 mQI6L/t1sMZMgV7dTzG+VMFhdW/JBgmhIa2sZnsMWSVhsiZb3p6sXJA0zz3/FOgreryI+bvmTHCw3Ipg1K0vj5PVZn8f7IFp/OcBTpzm7o1zrRzm4hwC1WlqhIZEWzlErmTrIVQeMTBCA8QXtWyM2dHXEtKRCpzdgWMoPYKaTHrrZLgZIsK5SK008FOYzeaV19FC/Lz24N2oe1tN5ucT14tTdUJcqVdmdLT9afSZnHd5VJcbyrUsjULbzqoJat/DBnbE88fsCh2uqoV1wPqy6KpNili3DiOI5yHh2PQoxZ/TbcKOep2zcQxnZp4etkeaC+ndwYKvqjw9aa+1scXw/AsAoIMzidaGkVdlh0mcqIeZBDuiICJnKcCQLhWpWKZcgVmuaORzCujlmjXECSMsC2+GjO20oQ5jfohd+WHRDFrVscGG67xWFTyOcpeFpT4U5dpTuEa3TIadhG41TtyKmBr1THyXjo4KwN5NVl5EtVb5WlWznVw1M5S51C7fgp7bRKy/tlnM3wuV4R/2ChNrywJDqUNns/0G0QD2bXPLOGD60Q8qlfBokMtR1oTzCeDGW8anmDg0JQBylfjLhBiIfnw19cjWKrD4Zru3+r7p5a4QofozOBft1u9uUkZpzmF4X89HgYIDeOsC1xHkpvnIajYwZbRGlCvviZBC98flSAFVSN+aGeHEbBUx77wKstgllJB9SOkV7b21/EvtPc/89MkJjO+jEyg75+nM5GsFjHNsrRgvLSeEnJtmxHEZ6+iv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JdktP71LCIvbuP6wVYgbL1ledoQ/HoPnsYKoZryunctpcfIpFWHd9V5qbpq6?=
 =?us-ascii?Q?jkcP8jGg3ogSak3sVtfWxItBwJkytOfVX8/X09vf9CFtj8Vuzah4pwged7rm?=
 =?us-ascii?Q?ssCs5Z/Bf73qdMg0wjIw/nSuH1/4ezv8ZvBB58b4Q3gmB3K7ZuwVibhn1+5z?=
 =?us-ascii?Q?ALhRrHtIRl6vnijyrT8erux+Xu912PXp/SpqJkthM3eDDS31Q3vol4AGlJ9w?=
 =?us-ascii?Q?Db4EEd7rcr49mXw0bLbYLrsPJmp+Wb4y5TyqFM0x7DavNIfkNdPuPCjaWMYk?=
 =?us-ascii?Q?5GZKmtBtFEPoQawQhkC/SYTO+xJMh3tPoTwy8yNcLQjF3N/JGa6P6Zo0tIl5?=
 =?us-ascii?Q?Wu1o2vBhBd8EepAJVtYvfs2BGkPz+GDoGOX6kCVpqjBRC5mDIwnIiEYko0ep?=
 =?us-ascii?Q?K3TaOAVCvfzTMd6EUOaOlV3vntDNTsDv5UFbSle6OjRBM4HxcLz4DBNIQoGP?=
 =?us-ascii?Q?/u2K/CxFvcHsKOYf/N7XR4AUUcAWRwCTrd8Nc5A2UrLyIN7YDIcn8XRhX2gv?=
 =?us-ascii?Q?wB7rc0antw+Du4NbThiIwVA5TCio9CSaKGqXzmMZ4+ZCG6OZZhRt5O1paXAz?=
 =?us-ascii?Q?/SrGao6TGYEy1EbaWfXVosD/GAiWNzSmj2Hv7EZdQDQVd+cTvIoLxZ356KKG?=
 =?us-ascii?Q?kb0rAvl4RDVsI5YouqdvTD3rJyFKSyW3E8GiIbS479hYQdZKzhXnj4g9YwOa?=
 =?us-ascii?Q?FhJdN3D+tE7og0WyjGZQdM6kYXjH8fFOZG8zmmV+nuyTa2BtjPoWS6mG+AFd?=
 =?us-ascii?Q?Xgty/XGnUbbRgtu03q9DtJE+T0lOKFgOHjO8FJgpUHSzXyx0WeVUDLBX4aS9?=
 =?us-ascii?Q?oOwOkfGzETpK3tOZhl0YC1sMF+jFbPt/4guu2G2wtnHfvwCzHGvVOSX/22Kb?=
 =?us-ascii?Q?iCPOl6kTPWnvH2uLp2P9jGe9iqLyoaJo3k7GX0+kBmFSlYe+OOZVwkjgzdW0?=
 =?us-ascii?Q?+UFdwStD/uQJtbz7uNKZDkBrArjk0LkvOvK8v+fNfDBQbMfkQeMJv3yfOKhw?=
 =?us-ascii?Q?xUGUuw9F2uVhkf2Al9X1EV1ny2m+c1dmxgfSZfpSnNad1VqT3TSpL6bclRwx?=
 =?us-ascii?Q?tMDiV0v5xgIUGYXjUbQHA1cOzOxUbj7NcWqWMzhdTK7PInCfF7r3Q1qDW9MD?=
 =?us-ascii?Q?77FrDa179vQbdgGh1cnYBxJ0CXJZ9YmIXAKe0syQDF+P916jt+XKD5WTGsum?=
 =?us-ascii?Q?jMCLisphDgsVsMunc0uIMn00QaqITB5mrqMCabXPZSjoOEJ6wrs1Ya6scUdu?=
 =?us-ascii?Q?BEmxVKbuAjG04/fQrLj0llkpVWcNBmzAaLSxhyxDjWAwXKntkE8l08LZmeH9?=
 =?us-ascii?Q?5nULaMNq8aksavsOYfiI4cXnc1DgC4RiAzbOTipiN5+kRSWMs2YbkHsNwLFL?=
 =?us-ascii?Q?ikgFs0cNUuvSIeCBlx87YxL0W31002WWX78k/7xYJA3F20WuJPe/ICuQFh/a?=
 =?us-ascii?Q?TCRLQAFqMDNt8FCScg3W4RollQcYacvxCPedFD9lzXgAJulBafiChoPAjxx9?=
 =?us-ascii?Q?63ycujHkm1g+6u57n0AtlTdq5JutZMF4RUxc8ea4+bx8GDWC1V/IiuRrAtb8?=
 =?us-ascii?Q?3TQaRkN+cAnIu7cwwAWStN0zoOD8eZCuQWS81QoSu5rwZ02AcuffodSSooh1?=
 =?us-ascii?Q?HAhFFigojf7Vo875hKJXBnHP+7/dBOC9PYQIG6rToR9szQHSykMhDRfn+FUC?=
 =?us-ascii?Q?Mp0wNfJFKAIVbJ/Ze2tyCZO+f6gMd9Z2xKThcfGs+6WX1CY4?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd925709-371d-4ba3-9546-08deb0d934f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 10:20:07.6127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDOtbbRiwYd/cuHyoWTvMSkfryCHlqM03OM/ap/ltOnCaKFyBDipxC3SYakwBFYl7GKkY+ZfFArkLinhQJCxBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9288

> > @@ -171,7 +171,7 @@ static void enetc_msg_task(struct work_struct *work=
)
> >  		if (!mr_mask) {
> >  			/* re-arm MR interrupts, w1c the IDR reg */
> >  			enetc_wr(hw, ENETC_PSIIDR, ENETC_PSIIER_MR_MASK);
> > -			enetc_msg_enable_mr_int(hw);
> > +			enetc_msg_set_mr_int(pf, true);
> >  			return;
> >  		}
>=20
> This isn't a bug in your patch, but is there a race condition here that
> could result in missed VF messages?
>=20
> The code reads ENETC_PSIMSGRR earlier in the loop. If a VF sends a messag=
e
> after the read but before the write to ENETC_PSIIDR, the hardware will se=
t
> the interrupt status bit, which is then immediately cleared by the write
> to ENETC_PSIIDR. When the interrupt is enabled shortly after, it will not
> fire.
>=20
> Should the driver clear the interrupt status before checking for messages=
?
>=20

enetc_msg_psi_msix() disables the message irqs before scheduling the
workqueue (enetc_msg_task()), so the corresponding bit in ENETC_PSIIDR
will not be set. And enetc_msg_task() enables the message irqs when it
exits. This will ensure generation of a new interrupt in the event of a set=
/clear
collision in any of the message source bits.

Therefore, this is a false positive, please ignore it.

