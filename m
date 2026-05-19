Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744C3357739;
	Tue, 19 May 2026 05:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169936; cv=fail; b=uqRt1n6RQtczWLfXrM7VY8Ups/BU0O4gTiFwKeUAP9diLxULR55uF7pzjdx2qJ3FW2WM+RMFkY3axawMGMX13dZ2wX7E988nq18UoPVkA8GJQiiuoABMNv5/RjXHSgO1pl30H7s/DyCeSQo9DmskwSIkZnQoNMZgaKlJ2HHifWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169936; c=relaxed/simple;
	bh=mksmrctzS8el0NS2UwCg0tD7XI2wGdonxFdKlaH0HIY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dijLUyEbxsM0EcvLD4bpmKkKmccG7dTImZPcKRxvmIi19yZ1T8c+UadA8OJ/8lCCscNbolYWXCsFuTrbk+kl/PqIr200+lwH/K8DNwQaV8sD3/GhiWoOwhd5OquiPBGFJBSEUcUI5iCO75mFajGvFmTvoY3hF1LzQJx+T+cIW9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gcp8oE9h; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gcp8oE9h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I02xdi6+YvfcMj7wgENeMDUTjbmbSK6ZZI0o+x7M08tt8uUCxsdviGnhhBOn29/oy++QD6bkVuncQltn8mGQnV5sunvFzkhnZgP9v5ZtC7wpNOuTqNIaT0Qh9pRjwWSKgteHFZYDL35JBxWfS5JWtgi9ugMp4wva3b0ClkWr9H4ZiGnqncsCVxtRcfu/4jRGZj3EhFiuPY9Gj04B2OB72idZUOw1EWnm009jRDTRrIIk5jh28B1x+u/qjFe3tf4xT8rP12IFiL11jgIpz1R0ag5jGlVQbUDA+7AmCXJjbKm6wAoQaGK8SRvboAXuADGC+EkJUDJKGWd59RYSIHG08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBQ0mv69fjostFxpfv56D0Kaa3/EsrUeqLn+s60KJqA=;
 b=SWhiDzv8xA2ySh8Swvn9tpGb7CmrUoR+eJ81On1wLD6VHcpA4J9Q6Yh+UgcgSQMO95lyxuQwagj2BpIn162g7RyXB4MROlmble9gDs74XRa02tRqonJGnhiGOmTRrRiKF1WuLYXmI8Je+ZOpkLFWCsYZCz7Oy2951uIBuFY+tuJOGmIFgF68RHVI+GKfxsccsSNqwoFWUbtp/ZF/cyWFQkYxh7+lEitPLK7RW7jN+T9/libcU3jIu7s4mQ/cUjB0wvRulgESl2e7vy5FZ8rb04zno+Ko6LmtiJ7ZprcPsFFbO5KqWkStcV9gtz1nB6lao2rbQhz6wHqQqjIG2uzbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBQ0mv69fjostFxpfv56D0Kaa3/EsrUeqLn+s60KJqA=;
 b=Gcp8oE9hX1Vpd44NQMATS3CnjB7fK95yEiyq6ObN0mMCEb8s8YusSnDq/JO0WYp57zaHz0bTPD9yJaodWqagiOqKnxMzcKwvz8mlNB4OLc5yLULapjhE0T7SXch969rdhjSvLWvpCuxIc55WVM2kQVcOIMsty3CHuNp7ODHmy6krqsLzjRhkdU3xzObVmyRQiWZSE8BuKtB7o/N5lHVb2AtwC9fZ5Zn4x0fhkHgpvs+B3Jx7Xx1o79LY3HpYll04tYC8sa3OpU5LYiRl3Dh9Ennj6xJj23GItPqeqk4zGLRA1G/08zqlYTwaw4effqlF3y9Rh+3XLqP8p4sBIOWpFQ==
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16)
 by VI1PR04MB10002.eurprd04.prod.outlook.com (2603:10a6:800:1d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 05:52:11 +0000
Received: from DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7]) by DBBPR04MB7500.eurprd04.prod.outlook.com
 ([fe80::c291:543b:4bde:cee7%6]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 05:52:11 +0000
From: Wei Fang <wei.fang@nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v2 net 8/9] net: enetc: fix initialization order to
 prevent use of uninitialized resources
Thread-Topic: [PATCH v2 net 8/9] net: enetc: fix initialization order to
 prevent use of uninitialized resources
Thread-Index: AQHc5nLpmOljOwZT/06dP/xS4Sj/2bYUq3QAgAAuIrA=
Date: Tue, 19 May 2026 05:52:11 +0000
Message-ID:
 <DBBPR04MB7500836C280BE5A10F4600FF88002@DBBPR04MB7500.eurprd04.prod.outlook.com>
References: <20260518030535.1057228-9-wei.fang@nxp.com>
 <20260519030416.B8ADBC2BCB7@smtp.kernel.org>
In-Reply-To: <20260519030416.B8ADBC2BCB7@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR04MB7500:EE_|VI1PR04MB10002:EE_
x-ms-office365-filtering-correlation-id: c319f51c-1ba6-4e38-8518-08deb56ac536
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|38070700021|22082099003|56012099003|18002099003|4143699003|11063799003;
x-microsoft-antispam-message-info:
 tHRj/mADFd5sCzwNsgNw+5TOaWujBTBI3B++xXnHfN2CuKW4lhB2zpg0wPibZnsYnKP09P9Ne4wrgr/LtihgRjp4ojcN7TNAmOqo1+FTbHMn46Z3ekCZLo1s9rE2NTww4uGbUkYgfewhYPhSJTp+yc5dxmeieQOXzJae+THGGLYQeSd/NB9YySo4xC9GXkKL+t9ysH0pFGutHIHvkmXcW+aeGbotdggoMxVwRpFmgDlmCVJZEpzDcy2gsma0qtvKovO1kAzgZCaRhTemV7cZbIbFV1JPUjufYtGtm5g4OEqceOdAeiDp2xsk7R5csT68ohRXHnIDlS1He+/1WarZJOj/ZI1A0Txz9L81RhyT7lP8Obt7YzkMStCvMKAxj4I37ZbOX6a2EFFZ5mauDJojLvem8t6BupFqh9UtYQ+mq80OIAQzR4xhJIigTN0IcKLagjBj+eT6PMEgtz/78A5K2vucNPYwa3qQZEw0PAY3HIBzctYUWrT7/P/K8VBZWO2QOflfE33kud0K1AQKxh9a0qjwuK5bz4vEJs1ikbjSCiiOT0L3y6UYSLzpRv/YHCSdSxvPQiLCZxI56qX1W5LjmuC5qKWWzCfXX2sRjiVNvN+KGlxQj93Wb1bM9Pjk2OZ4zSfIl5IJkVJNjhQvU1FjzDyjYxbB5orwiwvEBSLTyTQLcLIZlIe6YK5xF2ViLnOlIRy3ZyCUKIVJHZbAzS4uGRIt9tOKoaZFl+GsjVoEv3LL2UQd3i7mS5y6JQYancjc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7500.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(38070700021)(22082099003)(56012099003)(18002099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IrGNGyRXjWwoe8/elZ5ZynLER0f2EIJW8Wtm2NlpNdozy/nTjr3M+gF8ZK7w?=
 =?us-ascii?Q?3fkbcPkBmwaI7s7HSU/NvBEYRtxvltGlW4Ek53yajXN01tzxIj/qysBxQYaj?=
 =?us-ascii?Q?IS2YH2Vh70TxfI8CLAkeFDTxNdRv6faw68ml0ud7/wtP5NtNA/cnBd6K2aRE?=
 =?us-ascii?Q?zULh9xh8qfCxg/+GmFrHT5+vTsqwq35MxIZT/DMcBW4RZ6SV5yYdEEF7wBQK?=
 =?us-ascii?Q?nnVHCaqNxkGbJgnXzqsf6Mwn2WuAkqWSdLIaBKcUNVepQ3YppNqskE2TPNfF?=
 =?us-ascii?Q?FzFSbtA60VGiSNpCAW+wHyXQhTQiicKzmk5rFxx1nmFKRGzYfHSMufbgUwS4?=
 =?us-ascii?Q?U9iWfFKBQg7OgvE7P4dIwG0r7yDrWT4B4icGexcJ8acndPxCrGYTlojX6ZUo?=
 =?us-ascii?Q?Z78bz9B9nepjjVLW51MEwsCKZhHKwj2oYa/8c8LZPWlc2u0mdXeEzAFNB6JF?=
 =?us-ascii?Q?C8y59AoJCOKQduhT4dS8aHJBv01zunqJT6IRHe7rEhSyQtmTG+5EFNwH72NQ?=
 =?us-ascii?Q?pHoe1wpH2yD/tcR4pVTt7a5HTjpOKV0eIsXyaXyhbWxZBq0feOWlnYUrloXb?=
 =?us-ascii?Q?MPQu1Snl6q/VO8fM5Zj/S4989eahE9RLJ2mQz7wg6yN2tJX0UR44o26xT2e+?=
 =?us-ascii?Q?uZVvmODcsvv9d/FiJkhdMk/u0Lv7TIJlMWFFZ9hJtN2rur9FbM1n2WMKuQwM?=
 =?us-ascii?Q?PZA1LB06RVg2PQb4Gj3FK5zg0M5yBvLuMDi9b9WWRD7c1cTJyUC2vtGrdnCy?=
 =?us-ascii?Q?FYltPMUhYRxA59FTaJGtdtCJPWiSMM50lutqjcfbrnFglYgf2I7vSdZIK2aP?=
 =?us-ascii?Q?kgwm50laNeTqENGwDHupPzPZMzMusOm1XsbKbpL06OIe09YCan3pUowPXWAi?=
 =?us-ascii?Q?xS0x3Y1R2NS1IoQwvJm3roTlihLymjyFSFl3OV2NG+g9c0yutXI1LSPElYiK?=
 =?us-ascii?Q?SegRBFZacPheG7yVbiy6CzzbZ8qb4+CUBW1Z52YH0yz1fEt7MI8Y9oudVBZ+?=
 =?us-ascii?Q?9Ji/9CfLBg4IbweuWTpvZO3Ugj2mhy923zFmdEWSw4Z6cvjkESg9GM5I2Flt?=
 =?us-ascii?Q?slx/C9PbMExz4W/iNhaweXB6WYtkG+0HO2gOOaRNazYF6jciKbXvTXyieTSs?=
 =?us-ascii?Q?WJd0HSBdFyo3CPjVDDyf6qyFrlgnIasXna2Ubv8tASRuZZJWKm76AayAaCA2?=
 =?us-ascii?Q?J0YUHZw8Ddt9GfnsvpHAv+Z8wz9Ie1yGZU56rxH9hbJAYIkqduU6YYgyrNAB?=
 =?us-ascii?Q?KWzKgzsGbwpbZeBk2V4HKoDd3EuOsI5wJ1FVM2c9bGZwQZDBREqHc20Q0cob?=
 =?us-ascii?Q?RpCDD8t/9AXqQTV5wU5+1Q1k6EIgwloRfqARBwvFihyTOHA4vAev8Li3yTv9?=
 =?us-ascii?Q?q06gzmzv7InMaZW4yyv73zBY/QcscC74IVGNxR4CnThLBfYA8z8Kb7DXeDgj?=
 =?us-ascii?Q?D0StRJq088pDHQ+MHXxtct3EQ36ou/bSevJIgL7M99yjXjSBXND1ZjgRTE5x?=
 =?us-ascii?Q?WOeCCdJbLGE+HHHimOrqbTmhihYlvn3MQECkpIVSj2sB9xihWEew25+VsUQz?=
 =?us-ascii?Q?RP5Gle6IRgMjlEhPJ7diZODAY8LaNleMlxYo2sHHj8lpB4xIsWiRg8G2vc5r?=
 =?us-ascii?Q?c61FzejSfjFAO9RiF23cpMhxk/KPu8WGV2mM19TEHvw9hrFc4bnA2h5d//37?=
 =?us-ascii?Q?CREZZJtyUs+amTkNr++NbvJJuRz8Ls7RNaL7/LDbLLsfzA4a?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c319f51c-1ba6-4e38-8518-08deb56ac536
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 05:52:11.2538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZbhEnCBra7TNW4v2Na9JyPogyVkpgDWoodeG3Ld8iFXebYMg49unm22nTsUsyLL8UyccrlB6no6sYBLBTSk3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10002

> > @@ -151,14 +149,17 @@ void enetc_msg_psi_free(struct enetc_pf *pf)
> >  	struct enetc_si *si =3D pf->si;
> >  	int i;
> >
> > +	/* disable MR interrupts */
> > +	enetc_msg_disable_mr_int(&si->hw);
> > +
> > +	/* de-register message passing interrupt handler */
> > +	free_irq(pci_irq_vector(si->pdev, ENETC_SI_INT_IDX), si);
> > +
> >  	cancel_work_sync(&pf->msg_task);
>=20
> Can this sequence cause an unhandled interrupt?
>=20
> Since free_irq() is now called before cancel_work_sync(), if the mailbox
> workqueue task (enetc_msg_task()) is executing during cancel_work_sync(),
> the task might unconditionally re-enable hardware MR interrupts at the en=
d
> of its execution via enetc_msg_enable_mr_int().
>=20
> This could create a window between the work task finishing and the second
> enetc_msg_disable_mr_int() call where hardware MR interrupts are enabled
> but
> the OS IRQ handler is already freed.
>=20
> If a Virtual Function (VF) sends a message during this window, could the
> hardware assert the MSI-X interrupt, resulting in a spurious IRQ that mig=
ht
> disable the IRQ line?
>=20
> This regression is fixed later in the patch series by commit
> 675d55bcc780129a27acba4ec3a3cd33ecd510fc ("net: enetc: avoid VF->PF
> mailbox
> timeout during SR-IOV teardown"), which avoids the issue by destroying th=
e
> VFs before cleaning up the PF mailbox.

These patches are part of a series and are all designed to address issues
introduced by commit beb74ac878c8 ("enetc: Add vf to pf messaging
support"). If subsequent patches have already resolved the issue you're
reporting, please refrain from reporting it again, it's pointless and a was=
te
of time.

>=20
> >
> > -	/* disable MR interrupts */
> > +	/* MR interrupts may be re-enabled by workqueue */
> >  	enetc_msg_disable_mr_int(&si->hw);
> >
> >  	for (i =3D 0; i < pf->num_vfs; i++)
> >  		enetc_msg_free_mbx(si, i);
>=20
> Does this teardown sequence leave a race window where active VFs can
> corrupt
> memory?
>=20
> While this pre-existing issue wasn't introduced by this patch, calling
> enetc_msg_psi_free() before pci_disable_sriov() means PF mailbox resource=
s
> are freed while VFs are still active and capable of sending messages.
>=20
> During teardown, enetc_msg_free_mbx() clears the 64-bit DMA address
> registers via two sequential 32-bit writes:
>=20
> enetc_msg_free_mbx() {
>     ...
>     enetc_wr(hw, ENETC_PSIVMSGRCVAR0(idx), 0);
>     enetc_wr(hw, ENETC_PSIVMSGRCVAR1(idx), 0);
>     ...
> }
>=20
> If an active VF sends a message between these writes, could the hardware
> DMA
> into a torn 64-bit address?
>=20
> Additionally, if a message is sent immediately after dma_free_coherent() =
in
> enetc_msg_free_mbx(), could the hardware perform a DMA write into kernel
> memory that has already been returned to the allocator?
>=20
> This pre-existing issue is fixed later in the patch series by commit
> 675d55bcc780129a27acba4ec3a3cd33ecd510fc ("net: enetc: avoid VF->PF
> mailbox
> timeout during SR-IOV teardown"), which safely calls pci_disable_sriov()
> first to ensure all VFs are removed before mailbox teardown.

Likewise.

