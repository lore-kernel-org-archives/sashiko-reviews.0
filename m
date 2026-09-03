Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F34399001;
	Thu,  3 Sep 2026 11:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436224; cv=fail; b=tHWYh6Pclhm802Yz8TKlIJczk9ajXEp6p4HoIv60zi43o0oIxGUcy++KpVv3JGPQCxzfGfGEQPTYHtiqui84AC1CbZvxh4w6j+IffSTbgk1iPwyzaOZcycHByZcOU9CP7+vasUuWd+3wD4jDWs40tLeCpE/TroOfGnbYqaeTvXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436224; c=relaxed/simple;
	bh=mYV1ZobZ8h+tCndzQ48OdK4pH4ZM1RnJM61tMHsQ4AA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GbYA87DB7BX7eO6qH0aU9PboqsryluNAesF7X3mgQOnTy0W3gWq9L0YgI91DbSzRraQXsMGUILc8uRc2QsOB26ZTv/M/j79pBieWzC774cJ3jyElZC/kOIQe8HI1lW7jDUvbyHjGneTo4deRo0td9Ewv0IftVn6f2eHweKqvum0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lBD30hrZ; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lBD30hrZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhoYIOHxXTsUno61FbppxK3jVEfexBwth7ufCrJEcH44wGQ1gnJDHpxMtV0Obwkr8fjHw4/nIxqZ1X0Y5FqmWTg6xwWs4cSkSUBFMSYIzZxI+Ryw/ZGCPhyBXrFBVNoh5wK5aPBzVyIdLPEZspwteKnwLY6oUjv/MB2HTUCrjE6Y3nLb1ikFCFa6tolY/yhXg/6nd5HKUez/HI4Te0GGJxxUQgKfR7AGr57y4jzqyRy3c16UfDm0iO8sKsG+75deeD74by63dO4sqr82AzuPZwHmL0KgSJWWWlKGg4W7CNGhO1BmdcpTPEYrFWwYbs+TrTgNOZmTuH1wTKKxeYHocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJ61+KqKjYfEpWB1RfCGJAUQ1as6E5A4qyvs0C5qqbc=;
 b=BXu8BNlOqPoMzzaLlQYxEdltIOFIMW55lUmM1L/IdZXa390m2pMPh507v3H/5yrJ7jEO3/tO1VHakgIdxaL5Rbletlg0plR0uEuPSogxtCLM03o5e1B0hp1nRxYq/V7Re2LdSrRzElFNFJID7aEbHQFR76nJ4Dr9MJGsIfEmDXUi+k/qvbYlVKS7Sa/WR8iO84bMTWjb0BjLj9my7X0dZcXf70JHAoFw/S3mMxTofgJEFdraP3SvfIvuuQLK6J0mnC3JJ5q+coSu5vVv9EuF5booDj1O6E7VMOxxLuedd5kwxbUtAVstyu4m9HnWFWlCiiHC7yCz/voRhzsQDydOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJ61+KqKjYfEpWB1RfCGJAUQ1as6E5A4qyvs0C5qqbc=;
 b=lBD30hrZBbBsJjVix5cpia+nQexHTJNJmY7h2gBGC/5EyEt7UWkIdRkGchd2KThkk2KzQXdd7eIUV+g/yPHX+QNyM/aWAXVa7AHsQ+X7XOpTkszaaJycRPRJfCK5s9xmUD+Jls6u36SVBnx3l+ERNLg+jnAhg+BM2KYTrZmCxGyfggWeyVJ8hGypTcc2CeAw+xKOQW177NGjljZTT39k1gWIAtG17a+X3nQ0e2msrVFQnKfKWNImg1AxZcHKq0i0/7G6/FoiZbaORwJYmt/hoxO3ivCCUaOLOd2hQGqg6VP7JyKMnEkc7XChZ6ePMu5KPA+nvg6c07r03VhqnjoatQ==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by AMBPR04MB12448.eurprd04.prod.outlook.com (2603:10a6:20b:75f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:50:06 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 11:50:06 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v46 5/7] firmware: imx: adds miscdev
Thread-Topic: [PATCH v46 5/7] firmware: imx: adds miscdev
Thread-Index: AQHdOvZvEgpFgrOnvE6XVayDos/2Q7a7fCqAgABLggCAAJkBcA==
Date: Thu, 3 Sep 2026 11:50:06 +0000
Message-ID:
 <GV2PR04MB122719C805D8A7AF38E44E03A95B62@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
 <20260903-imx-se-if-v46-5-aefaab525034@nxp.com>
 <20260902163521.BB3231F000E9@smtp.kernel.org>
 <apiPoIfD9QKqBWJF@lizhi-Precision-Tower-5810>
In-Reply-To: <apiPoIfD9QKqBWJF@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-03T06:13:13.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|AMBPR04MB12448:EE_
x-ms-office365-filtering-correlation-id: 8e2fb002-f8cf-4433-dffe-08df09b17f70
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|10070799003|23010399003|38070700021|6133799003|3023799007|10067099003|4143699003|11063799006|5023799004|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 1jotfp+TzZiyxq6wkgA6S0TU8yhiuhxFiVWw0/7/SYhkYebF2skmkv6NjbIfkXMrhCiqRM11Vci4ahnRsm6a3Ha26YcL665wjKDiepaNfIGl+3EpdPebot2igJoMjPOV2yCt0Tqjgsvk/HVrsz3sJvKRk93p3y02ednFGytzi57p/hnF8tZVfQchA5YDz+K73CAVbPu8VtEBrdbdisl2Vh2CtsPSWkH8cwr72lEQt0+F4bwWFmXvntjtswYZe1hqDRfQgOhgcjJNT7XiBjKfLUzZ/kCQlGX5ytoXKKhpGvstYWOON47hpErUeNM3Sa8R/G6ws/ykn+uHFj82PruXzih29M7Oqw1QBiMVGUhEczGpUUNJbbP6WtFdeJiSq9PHQzSjsivqQQ1PJ+jmINbUnV9jDRUKNRyLq/SMqddLpOr57rViCGjnK4sLUCInryG+dl/RB8yCpNRRRSTSKhhFaGQXjRh9tzDiqBDAGzwuVcLQ3QQjudcUsrzE+IIHjGoD8GU7AcDb2qE5LrugaKZYjMMSD9ero478pvdUN5/cBEEB+xXtXZ7fRuKGnmtcSsvkvMRwApovOsTU8PTWVHsMRpul8h1BlhkUt7wqZw805UyLWmIMrAt/kVvGrT9Ci5m8tZ1eEpQ++2CKpFaJGRwBWwTP3XZ6pdbCYjrtnyeM1ug=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(10070799003)(23010399003)(38070700021)(6133799003)(3023799007)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cJS69x75wBrY7Ly5CyPKmSJJSB3q7XSrlCLQDboUJ1IKSPAj76UU1GPoIYSM?=
 =?us-ascii?Q?+ueZoqTGDI5lNN3hkvh+MoTuXZMGmg0L+FTyFMfUK4h/sNIR7d61o7l2N6Ns?=
 =?us-ascii?Q?o8j4VNI9w/6P93GE9+f6DsGasWQn13e4xRlDP5wtO5NzfyYuxrnVCJl7XBta?=
 =?us-ascii?Q?ovzjN904GNHRkhsmkUEJQfQ1M9jdE+tB3y5I0H4LYF0UtKP9uIkFoHbJOowR?=
 =?us-ascii?Q?ikF3oGiZ8TMPiTFFyyAB3QT0NYYU16/GKdlUkBbBQcMbO7yCIvdY13vmB5PZ?=
 =?us-ascii?Q?wm1xDN0LoybFS9pl782XYoxqwR085cHw1HyemtlH5i4G761cAD7NATUzI+/x?=
 =?us-ascii?Q?dpMqAgzX6n4fPg1EDohHZsn0HFonp5wB9yDsGqxzTxJJMOYcy0cbr/CRIXTl?=
 =?us-ascii?Q?OsNCdPtIo3HCih7rzfF1+2vu6JLGw6pQlwz8dUbOS7ciKKrqBkOnUpvB1Mrn?=
 =?us-ascii?Q?7/jwOR6Z/iZQ+VJfn3iyv+olsIanH4YmFls4Sn/EIYN7FzhFSSf0DWBmymTB?=
 =?us-ascii?Q?lf1OWmmttGw8IIDDDPEWZpHqKIkiGmOjffEJd6iQIM3+KPrd0KyeQEILwMh7?=
 =?us-ascii?Q?S1iw6J4vj643KVnT4JwmTNepmuUPW89eF8zQHzDGSak6bleuEgSRToNKXpAJ?=
 =?us-ascii?Q?MiGnIqJl398d3tOVqskSKEP1BRtKZ2bmlQDt4tlwsmbDMYuVX1yZydEwhcEu?=
 =?us-ascii?Q?PqN0/DIdUvI9+UMzuT4XU+WUl0ApRcrQ8v26MHUReVONN+rHyCLFZbno7EsH?=
 =?us-ascii?Q?1Q9/JOPG1LlanPBBYTiSuQNbSGkmjy9tfL7mTH3KeLgEek8njjVAx48UQWvx?=
 =?us-ascii?Q?z94OhI/qIcpEV8mtEJqxnty5kX88rGwtp+HX4JP7kWXlwS3HlaeB/8iO87ik?=
 =?us-ascii?Q?nCmtB/6//rZLqNoU4V9J4Mr1VdnnbG5glLAR2A3+uUaG9Thcfh/OjV2/QhyL?=
 =?us-ascii?Q?aC/iIbYC/mO114UZOp3Dgg4kpJqMFNZLHqMN7FuuO9/zN5eblBargG/kVNz8?=
 =?us-ascii?Q?x06mn0KudEsNscZs2fkhLyt76r+aVO+xzOipAD5bRoRm+8F6Y5CxPXMqksI1?=
 =?us-ascii?Q?L8SKAmACl1HyrELMBanlPAOs5Z3LxRrPCPstisNGbjLuF5JNt8iug0Yi2s/V?=
 =?us-ascii?Q?6M10to304PY96Gdr4u/XjSMX8N8XvlDDsULnFAj7KsmmWA4x8BpM9gRX1sd3?=
 =?us-ascii?Q?m+KBVaq5h7g9NPfoOIlatwaFvCgb9hMLlgf1UPxSwVEXLEy74TjuY5QeyNn5?=
 =?us-ascii?Q?V0tISVW9MrHxu/9/b0SvafSpj7Xgadbmgedb4Kgf0aRpOHizACAUTjrEuuH/?=
 =?us-ascii?Q?vrYgLL0WkmFw/VJ7R57599i1ABBSA58fJJEgqWOtQr5kk+Sfv6C10ZPKQdBb?=
 =?us-ascii?Q?rBlBibjROviJBXANuggoIkjkq0BWQeE5c28LYJG6q0zUqvLhHpSGowK++FT1?=
 =?us-ascii?Q?6UNwvNadGV0lugwRJgU/LdcdhAJUW5fo5a/G7+VsKfHSgsOVCNeD+mPTQgXO?=
 =?us-ascii?Q?a7t9Vhu7ndZmlkwllkkAmptDjVVt74LTd9lUnx2h6nMlf/qRovMDd3No75RS?=
 =?us-ascii?Q?rZwzunla4mnj6phQrHGIze/i5y8ebDPQ5vSJOxlT3m6aRaKJmJWKhbpCc4RK?=
 =?us-ascii?Q?LlSDqTbGmbvNTyWcfDkwUI8xE+nRsqTa5Q2rK8tZ8NfaH5u+Ou5Tbp7F7YI6?=
 =?us-ascii?Q?v7793U7/gnyTPo2twO2wOh/7aw3lkrv50Oq+L2Vd4Lfss0jby/z0YqmMuoBS?=
 =?us-ascii?Q?jMAk5uClWXWzQxedec4Ab6clcf9rUDshlotHkIoPPNMHxx6BCKook0Uk2hjE?=
x-ms-exchange-antispam-messagedata-1: ChGmcO7F4JxigQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2fb002-f8cf-4433-dffe-08df09b17f70
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 11:50:06.1521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hGSsH/EEwdp+/P37nS4y3tbHewkiYRgztjM7d0J3mTgeqcAzWiL0Oo/jHBTNyVvVIqZB7/vda6krgFf5gAswhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12448

> > > @@ -377,9 +701,24 @@ void se_if_rx_callback(struct mbox_client
> *mbox_cl, void *msg)
> > >           se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
> > >           spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> > >           if (!se_clbk_hdl->rx_msg) {
> > > -                 /* Close circuit breaker on spinlock race */
> > > -                 atomic_set(&priv->fw_busy, 0);
> > > +                 /*
> > > +                  * Only schedule fw_busy_work when going_away is
> clear.
> > > +                  * se_if_probe_cleanup() sets going_away under
> > > +                  * clbk_rx_lock before calling cancel_work_sync(). =
If
> > > +                  * going_away is already set here, teardown has
> already
> > > +                  * run (or is running) cancel_work_sync(); scheduli=
ng
> > > +                  * the work again after that point would re-queue i=
t
> > > +                  * against the freed priv object, causing a
> > > +                  * use-after-free when the work executes.
> > > +                  */
> > > +                 if (atomic_read(&priv->fw_busy) &&
> > > +                     !atomic_read(&priv->going_away))
> > > +                         schedule_fw_busy_work =3D true;
> > >                   spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock,
> flags);
> > > +
> > > +                 if (schedule_fw_busy_work)
> > > +                         schedule_work(&priv->fw_busy_work);
> >
> > [Severity: High]
> > Does this code risk a use-after-free on the priv object? The spinlock
> > is explicitly dropped before schedule_work() is called, which widens
> > the race window. If cancel_work_sync() runs concurrently in
> > se_if_probe_cleanup() while the lock is dropped here, it will return
> > immediately since the work hasn't been scheduled yet, allowing the
> > object to be freed before this thread calls schedule_work().
>
> schedule_work() can be call at atomic context. move it and replace
> "schedule_fw_busy_work =3D true" may resolve this problem, because you se=
t
> going_aways under spin_lock.

Accepted. Will fix in v47.

>
> >
> > > diff --git a/drivers/firmware/imx/ele_fw_api.c
> > > b/drivers/firmware/imx/ele_fw_api.c
> > > new file mode 100644
> > > index 0000000000000..72cecc5c8e258
> > > --- /dev/null
> > > +++ b/drivers/firmware/imx/ele_fw_api.c
> > [ ... ]
> > > +int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *dev_ctx, struct
> se_msg_hdr *header,
> > > +                     u32 tx_msg_sz, u32 rx_msg_sz) {
> > [ ... ]
> > > + case ELE_STORAGE_OPEN_REQ:
> > > +         /* Might be cleared as part of tear down. */
> > > +         if (dev_ctx->strg_hdl) {
> > > +                 ret =3D -EEXIST;
> > > +                 break;
> > > +         }
> > > +         /*
> > > +          * Reject the storage-open request when another context is
> > > +          * already registered as the command receiver. If we let th=
e
> > > +          * command through, FW would allocate a new storage
> handle and
> > > +          * start sending NVM callbacks for it; those callbacks woul=
d
> be
> > > +          * routed to the existing receiver (process A), not to the
> > > +          * caller (process B). This would let process A observe and
> > > +          * tamper with process B's NVM traffic. Reject early, befor=
e
> > > +          * the command reaches FW, so no handle is allocated and
> the
> > > +          * state stays consistent.
> > > +          */
> > > +         scoped_guard(mutex, &priv->modify_lock)
> > > +                 if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
> > > +                     priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_ct=
x)
> > > +                         ret =3D -EBUSY;
> > > +         if (rx_msg_sz < ELE_STORAGE_OPEN_RSP_SZ)
> > > +                 ret =3D -EINVAL;
> > > +         break;
> >
> > [Severity: High]
> > Could concurrent ELE_STORAGE_OPEN_REQ commands bypass this
> exclusivity check?
> > The lock is dropped immediately after checking
> > priv->cmd_receiver_clbk_hdl.dev_ctx, which creates a race window
> > priv->before the
> > command receiver is actually registered. This might allow a secondary
> > process to intercept the NVM traffic of another.
> >
> > [ ... ]
> > > +void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct
> se_api_msg *rx_msg,
> > > +                  bool is_cmd_interrupted)
> > > +{
> > [ ... ]
> > > + case ELE_STORAGE_OPEN_REQ: {
> > > +         int rc;
> > > +
> > > +         /*
> > > +          * Record the storage handle before registering as command
> > > +          * receiver. FW has already allocated the handle; if we
> assigned
> > > +          * it only after a successful registration, a failing
> > > +          * set_dev_ctx_as_command_receiver() (e.g. -EBUSY) would
> leave
> > > +          * strg_hdl at 0 while the ioctl still returns success to
> > > +          * userspace. The kernel would then never close the handle
> on
> > > +          * teardown, leaking it in FW. Storing it first guarantees
> > > +          * cleanup_dev_ctx() closes it on the next close(), regardl=
ess
> > > +          * of whether registration succeeded.
> > > +          */
> > > +         dev_ctx->strg_hdl =3D rx_msg->data[1];
> > > +
> > > +         if (is_cmd_interrupted) {
> > > +                 if (se_close_storage(dev_ctx, dev_ctx->strg_hdl))
> > > +                         dev_err(dev_ctx->priv->dev, "failed to clos=
e
> storage.\n");
> > > +                 dev_ctx->strg_hdl =3D 0;
> > > +                 break;
> > > +         }
> > > +
> > > +         rc =3D set_dev_ctx_as_command_receiver(dev_ctx);
> > > +         if (rc)
> > > +                 dev_err(priv->dev,
> > > +                         "Failed to register %s as CMD-
> Receiver: %d\n",
> > > +                         dev_ctx->devname, rc);
> > > +         break;
> > > + }
> >
> > [Severity: High]
> > If registration fails due to the race mentioned above (rc !=3D 0), is i=
t
> > safe to only log an error without closing the storage handle and
> > without returning the error to the user? The ioctl will successfully
> > return the valid storage handle to the second process.
>
>
> suppose should return fail to user

Not a bug.
Failure status can be fetched by the user using the IOCTL SE_IOCTL_CHECK_CM=
D_RCV_REG_STATUS.
The advisory early check is kept as a fast-path rejection for the common ca=
se.

FW will reject the second request for opening the storage handle.
It will not reach here. Hence there will no race. This mentioned in my prev=
ious dispositions.
Sashiko is a bot, it will keep flagging it do not read the disposition.
Your suggestion is really appreciated, if you have any. Thanks.

>
> >
> > > diff --git a/drivers/firmware/imx/se_ctrl.c
> > > b/drivers/firmware/imx/se_ctrl.c index 0792e5152436b..baeb28929b2de
> > > 100644
> > > --- a/drivers/firmware/imx/se_ctrl.c
> > > +++ b/drivers/firmware/imx/se_ctrl.c
> > [ ... ]
> > > @@ -341,31 +719,144 @@ static void se_if_probe_cleanup(void
> *plat_dev)
> > >   if (!priv)
> > >           return;
> > [ ... ]
> > > + while (true) {
> > > +         dev_ctx =3D NULL;
> > > +
> > > +         scoped_guard(mutex, &priv->modify_lock) {
> > > +                 if (list_empty(&priv->dev_ctx_list))
> > > +                         goto out_done;
> >
> > [Severity: Low]
> > Does mixing goto-based error handling with scoped_guard() macros
> > violate the subsystem's LIFO cleanup definition rules? This can cause
> > confusing ownership semantics and can lead to resource leaks or double
> frees.
> >
> > > +
> > > +                 dev_ctx =3D list_first_entry(&priv->dev_ctx_list,
> > > +                                            struct se_if_device_ctx,
> link);
> > > +
> > > +                 /* pin this context so close() cannot free it under=
 us
> */
> > > +                 kref_get(&dev_ctx->refcount);
> > > +                 dlink_dev_ctx(dev_ctx);
> > > +         }
> > > +
> > > +         /*
> > > +          * Local cleanup outside the global lock avoids ABBA
> deadlock
> > > +          * with paths that already take dev_ctx->fops_lock first.
> > > +          */
> > > +         cleanup_dev_ctx(dev_ctx, false);
> > > +         kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
> > > + }
> > > +out_done:
> > > +
> > > + /*
> > > +  * Cancel fw_busy_work before acquiring se_if_cmd_lock. The work
> > > +  * handler, se_clear_fw_busy(), acquires dev_ctx->fops_lock. A
> > > +  * concurrent close() may hold fops_lock and then attempt to
> acquire
> > > +  * se_if_cmd_lock via se_close_storage(). Calling cancel_work_sync(=
)
> > > +  * while already holding se_if_cmd_lock would therefore deadlock
> all
> > > +  * three threads. Canceling first, without any lock held, lets the
> > > +  * work and the close() finish independently.
> > > +  *
> > > +  * going_away was set under clbk_rx_lock earlier in this function.
> > > +  * Once set, se_if_rx_callback() will not call schedule_work() agai=
n,
> > > +  * so the work cannot be re-queued after cancel_work_sync()
> returns.
> > > +  */
> > > + cancel_work_sync(&priv->fw_busy_work);
> > > + /*
> > > +  * Free the mailbox channels under se_if_cmd_lock.
> ele_msg_send_rcv()
> > > +  * holds se_if_cmd_lock for the full duration of a synchronous
> > > +  * transaction, including the mbox_send_message() call on priv-
> >tx_chan.
> > > +  * going_away was set above and complete_all() has already woken
> any
> > > +  * in-flight waiter, so any transaction in progress will unwind to
> > > +  * -ENODEV and release the lock quickly. Acquiring se_if_cmd_lock
> here
> > > +  * guarantees no caller is still touching the channels when they ar=
e
> > > +  * freed, and nulling the pointers under the lock prevents any
> sender
> > > +  * that races past the going_away check from accessing a freed
> channel.
> > > +  */
> > > + scoped_guard(mutex, &priv->se_if_cmd_lock) {
> > > +         if (priv->rx_chan) {
> > > +                 mbox_free_channel(priv->rx_chan);
> >
> > [Severity: High]
> > Could the premature cancel_work_sync() allow schedule_work() to queue
> > work on a freed object? Moving cancel_work_sync() after
> > mbox_free_channel() would guarantee no new work could be scheduled
> from the rx callback.
>
> suppose it can be fixed after move schedule_work into lock

Accepted.
Moved after mbox_free_channel().

>
> >
> > [ ... ]
> > > +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx
> *dev_ctx,
> > > +                                     void __user *uarg)
> > > +{
> > [ ... ]
> > > + err =3D ele_msg_send_rcv(dev_ctx, tx_msg,
> cmd_snd_rcv_rsp_info.tx_buf_sz,
> > > +                        rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
> > > + if (err < 0) {
> > > +         /*
> > > +          * -ERESTARTSYS here means the wait was interrupted by a
> signal
> > > +          * after the command had already been handed to - and
> executed
> > > +          * by - the firmware, with its response delivered into rx_m=
sg
> > > +          * (ele_msg_send_rcv() converts only a positive, i.e.
> successfully
> > > +          * received, result to -ERESTARTSYS). If that response carr=
ied
> a
> > > +          * freshly allocated session/storage handle, record it now =
via
> > > +          * fw_api_specific_ops(): the handle is already live in
> firmware,
> > > +          * so leaving it untracked would stop cleanup_dev_ctx() fro=
m
> ever
> > > +          * closing it and leak the firmware resource. Validate the
> > > +          * delivered response first, using its own declared length
> bounded
> > > +          * by the caller's buffer, so a truncated or malformed repl=
y is
> > > +          * not acted upon.
> > > +          */
> > > +         if (err =3D=3D -ERESTARTSYS) {
> > > +                 u32 rsp_sz =3D rx_msg->header.size << 2;
> > > +
> > > +                 if (rsp_sz && rsp_sz <=3D
> cmd_snd_rcv_rsp_info.rx_buf_sz &&
> > > +                     !se_val_rsp_hdr_n_status(priv, rx_msg,
> > > +                                              tx_msg-
> >header.command, rsp_sz,
> > > +                                              tx_msg->header.ver)) {
> > > +                         se_dev_ctx_cpy_out_data(dev_ctx);
> > > +                         fw_api_specific_ops(dev_ctx, rx_msg, true);
> > > +                 }
> > > +                 /*
> > > +                  * Returning -ERESTARTSYS would let the VFS
> transparently restart
> > > +                  * the ioctl, which would re-run the command with
> the just
> > > +                  * cleaned-up (zeroed) shared input buffers. Report=
 -
> EINTR instead
> > > +                  * so the syscall is not auto-restarted; userspace
> enters its
> > > +                  * signal handler and can decide whether to reissue
> the command.
> > > +                  */
> > > +                 err =3D -EINTR;
> > > +         }
> > > +
> > > +         se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg,
> > > +&cmd_snd_rcv_rsp_info);
> > > +
> > > +         return err;
> > > + }
> >
> > [Severity: High]
> > Does returning -EINTR here without copying the rx_msg payload back to
> > userspace cause data loss or corrupted retries? If the hardware
> > operation completed successfully but was interrupted by a signal,
> > masking success with an error forces userspace to discard a valid
> > payload and potentially retry, which can lead to cryptographic IV reuse=
 or
> leaked handles.
> >
> > [ ... ]
> > > + /*
> > > +  * Validate using the size the firmware declared in the response
> header
> > > +  * rather than cmd_snd_rcv_rsp_info.rx_buf_sz (the amount actually
> > > +  * received, clamped to the caller's buffer). If the caller supplie=
d a
> > > +  * buffer smaller than the firmware's full response, rx_buf_sz
> reflects
> > > +  * the truncated copy and se_val_rsp_hdr_n_status() would fail the
> > > +size
>
> check size become meansless if firwmare can truncate it.
>
> Frank

Fetch the actual size received from mailbox-call back via ele_msg_send_rcv(=
).
Use that actual size to be validate through se_val_rsp_hdr_n_status().
Accepted and fixed in v47.

>
> > > +  * check, causing fw_api_specific_ops() to be skipped and any fresh=
ly
> > > +  * allocated session/storage handle to go unrecorded. Using the
> > > +  * firmware-declared size ensures a well-formed response is always
> > > +  * recognised and its handle is tracked for cleanup.
> > > +  *
> > > +  * Any size discrepancy between the firmware response header and
> the
> > > +  * userspace-supplied buffer is already logged by the mailbox
> receive
> > > +  * callback before control returns here.
> > > +  */
> > > + rsp_status_err =3D
> > > +         se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg-
> >header.command,
> > > +                                 rx_msg->header.size << 2, tx_msg-
> >header.ver);
> >
> > [Severity: High]
> > Does trusting the firmware-supplied header.size instead of the actual
> > user allocation size cause an out-of-bounds read? Since
> > se_val_rsp_hdr_n_status() reads from rx_msg->data[0] assuming the
> > buffer size matches the firmware size, a maliciously small user
> > allocation could lead to out-of-bounds access on the kernel heap.
> >
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260903-imx-se-if-v46-0-aefaab525034@n
> > xp.com?part=3D5

NXP Confidential
