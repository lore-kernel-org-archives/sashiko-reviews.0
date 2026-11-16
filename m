Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794869344;
	b=jpPulBV35qIxMzLJA2fgJISIv9frf6YvYP9p3l0Rs+ILw9jbgENLlvLELTYFtN1z9rEA
	 s0unan98uTVSGMfil0MvwhEUu6a+PdrgZBEAZsgOU42FUFENZxdviGCG5PSnwCfFRzNzr
	 9DY7iVGfDmeZkV8a0xyF12UNoRZqefF+DIqsOMx7HeDUIB5/3OLgAIjdKzHRneBtoEzqx
	 RNUCkDnoG14XEAhxCjOWlNvSC4SzhDmNzdKldeNH3UMR3oUTo+aJqrjHaBR76VApP79s2
	 yQE08rWt4fj6W36ZQHuH8Njr/1pwM3xxUF1h+VHvtal96DGj3V7HGfWhKQGLiOTQAYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869344;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 dlp-product:dlp-version:dlp-reaction:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=l/wKmFjR4FRb3MV0/wHwijIgS40Y/J0HNgNjI6WHtDA=;
	b=jn99lLHFA+LheAVeYJLpuL2QAkSvxE1GVQGWpBe9aR4QAYottGrWnXXJUD7QL530EWoR
	 CJhYacWqk0p1GBrdAixX2XRg1v3zgw85u4xxqT1QEBOqLnP3IQf+x1Tem7berjuZCpl4A
	 eS1iwytG2dbgLA0uCHFVP9BWZ83zNzA5c7tVc8Hqy1Hnv7zVg3nCUGfZ2BnwIlsL+e2vs
	 3EnfnscfAGxisYuAlmTeWY+k7vhZ3ABTIBtcljIBgIdx0eU1TjIATk7BRJOEG2+xqfdU/
	 1wDP0oMSbdS6Jh9kH42GC97Ao5XK6zWq3X+/RYoyJG11YHM0noYGEKoG/NmMVFzRk/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rambus.com;
	spf=fail smtp.mailfrom=rambus.com;
	dkim=pass header.d=rambus.com header.i=@rambus.com header.a=rsa-sha256 header.s=selector1 header.b=toergWoN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.81
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11020081.outbound.protection.outlook.com [52.101.46.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CFD606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 22:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86CFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rambus.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=rambus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rambus.com header.i=@rambus.com header.a=rsa-sha256 header.s=selector1 header.b=toergWoN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yh0ESKqkPoXaQG8eVI/5QLCGXp4yDJsaYJTkMe5UarA65J+flj/3Ie0PF6/+hdkqklnJFgdc+GmqxhFs5t+7Uj+VlalA7mVixhHoyZqysg6I4uBn+VlqDKbi4KSwcTfLuHltVYvHiZAUInkwaVMrwvegG0Xev4dzhTV8n2/Aw6lkRGLYfsZ7MX81kYjcG00hLXLUXhU9BcSUUoxdOcGeHwRzf+seHdgo9X5kKUUuVCxGRZnvmi60YJgN+rBjUWbJWKZsbEURRGFc/nmmTWwVZ3NIEED94+oU9wSevCUHW6/iloJE6F2pX/4CiJoclUS2v2rJP2WywQ3MxB03IYoTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/wKmFjR4FRb3MV0/wHwijIgS40Y/J0HNgNjI6WHtDA=;
 b=Ddt6n1CQtRIq8VNHIx8G9XONwtvissxHmfzY8fGMqcP4VdG6q1uXrJAK/pW7I3SNW9cW3dluUhR05dGdN9YvtzL3CU87CpKtJPTJ+lFe6W+am6C+wu4Bq5uiQ4xQe8UVDx4QMlBBa1qqNufUGrjSV2wqfxCyhU5+Card28EHAlvtr43Fl5cCmqBG9l344NAW8TYZMh9WUEO0h60WG1+fgZAjvawn4uZDSAJnQGEf5QNU2rfnXyRKhRsjEpMyXBHNZhlCJ4YMgIGbqNzNewI+E1BPOQbwmMAC9SW7Qul5Xauadn9fTNcTtGt/prJcXE3WwY/LCPWB3j0PGyPGaDG8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/wKmFjR4FRb3MV0/wHwijIgS40Y/J0HNgNjI6WHtDA=;
 b=toergWoNDcw20ZovE1BKdwb6mShGgWEoaV6Ka3+RESrcbI+EjCTxQYr7z7TUPCSuwiiAp6JLEfTwLDhXheRasn+eq991r243KsTiZmcwhRZSyjvBOrNr/fZoPhS8bz4iUJcsmNQjsXHdHEtxoV19AHJ4Q9lAA/zxo5eTj5gZbV9+2SAq4+xRtOJfY+U0RDgj0YOrLB/ZsfdN2+HLYA4RWr7V6GEXfmGODVUIl431k3BurdpEojHVKU6lD2sW09Zy8SaSCyOaqGS9v6upeJreMMrtXhA0KPR2I3M39R6PAlTx605mAc40rGcYdcyXcBKeEU8nOYATArMh99P5wCG0bw==
Received: from SJ0PR04MB8406.namprd04.prod.outlook.com (2603:10b6:a03:3d3::14)
 by PH0PR04MB7415.namprd04.prod.outlook.com (2603:10b6:510:18::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 22:48:58 +0000
Received: from SJ0PR04MB8406.namprd04.prod.outlook.com
 ([fe80::cbad:dfcc:82:7dbf]) by SJ0PR04MB8406.namprd04.prod.outlook.com
 ([fe80::cbad:dfcc:82:7dbf%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 22:48:57 +0000
From: "Ousherovitch, Alex" <aousherovitch@rambus.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Krishnamoorthy, Saravanakrishnan" <skrishnamoorthy@rambus.com>, "Wittenauer,
 Joel" <Joel.Wittenauer@cryptography.com>, "Nguyen, Thi" <thin@rambus.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	<rdunlap@infradead.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v8 4/5] crypto: cmh - add AES skcipher/aead/cmac
Thread-Topic: [PATCH v8 4/5] crypto: cmh - add AES skcipher/aead/cmac
Thread-Index: AQHdcTPqNFe/xeHG9k+5MlgfGFK287cnnXqAgAm5S2A=
Date: Mon, 16 Nov 2026 22:48:56 +0000
Message-ID:
 <SJ0PR04MB8406B9447401F28535E76C10D77C2@SJ0PR04MB8406.namprd04.prod.outlook.com>
References: <20261110-cmh-b4-a-v8-v8-0-4cea8ebc1d40@rambus.com>
 <20261110-cmh-b4-a-v8-v8-4-4cea8ebc1d40@rambus.com>
 <sashiko-outbox-207570@kernel.org>
In-Reply-To: <sashiko-outbox-207570@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.14.1.396
dlp-reaction: no-action
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rambus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8406:EE_|PH0PR04MB7415:EE_
x-ms-office365-filtering-correlation-id: e9daf613-8b63-4a2c-45d0-08df4433cc3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|921020|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|5023799004|38070700021;
x-microsoft-antispam-message-info:
 5CslXY9IRvqvrrUEBp7OqGf0xBJ8hXPLjgA8WDxUTydd1464D102eOA2j5qUoMmsjqIv3riUuhcOn987iP2ZsYtPYfr+8AqiXYhHG6OLV5N+0ZJR3JVa7P2L1Ht4xEt38WbAnMOmzIR7dt0ZwAVpluv+AsDDjqDLVe8MrG8YBRzqNPXl0gw4xAbcwSZVbgbY7Dse+ixv9+KlFm7+ruI85VuyvVGKjotcZGF6Edp9c+UM1m+kicWO5vLIdbeA7viRGx0H8Q5mxL0RS5dB5LtBWKRi/akYT9je3LBHPWyayS/XdYkoE2fGh7NTPhda5NlDHNcefbMBh67Nz5srFwjKLTwpuxgy36VNR8UeguZZw17HU9qUcKn5UHpVKeAJdwkr1LLAsgGQxYfURKWsnvLx2vjObHqkP/jnFXjFMKi2gN3iTpfZ5N/88gPEYcNjIL1N4NoTKJWwvFBLIVOcz0r7SPzSdkzF4WtpxKjd8AC2e4B0FxKVhkGUUy9yRUBddXlHjSMGUBm336KBfq+RMt9qMATPDvgg5oFg/ndCNvpepWLJElzNq6wwEoEJLfIgvc23Y2aYbP7/yQiLInCS4caT8YCeIQ0vK7npmH5Js9Qad6HPbt5eaZgbowt/bmTEfP5ap4orZZAoJ47L+vOvYBom4DsR5qvAhzCA8JxaKhMJZRqahXxw+epXCFQMU+jvWDXTWnFZp7Fe10X4X9rhAsmoTkZ//S+wKXoriAdzX88M+MFSEcMwWf0MUMnRpFAJXFVp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR04MB8406.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(921020)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(5023799004)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vNNbPAr+v7PYAOcxd+CBLinxK5XBhtcxPblLPeU/E5+wD2oHYHp1o78joaG/?=
 =?us-ascii?Q?MezXno02IIO1YMCCeTjdBVk1fvofwjUOxMSMVbuOrp7hGjrgTShMkK4fT0ah?=
 =?us-ascii?Q?02/tZRX3rNFaD4/rr8kB6XZAGK37By8y1OhdJICup57moGf8e4p6VjgNfJtO?=
 =?us-ascii?Q?ScF3b0P7RC4Coq/GiGlQBeUg5gsylU7CLl5imv9giNCT5j/nhZYBreZ1PX7Q?=
 =?us-ascii?Q?HPz9r50pFXJL7LqNl+VXs3aizbKNAnKruQ58lutH5+UuJ/xZ5l/xPdSZ8bBP?=
 =?us-ascii?Q?vByMwL9Dxyt+JXKmYz4U3u8QFw105eV8upjwxVHZLvNedxV/jI+1RyaKRtu/?=
 =?us-ascii?Q?x3mryjqbJ9AuJwBixyeoBA2UbLXKMzr11wZHUCLIjPih6yDh2BJRHWX6Cqe3?=
 =?us-ascii?Q?z8jQ450lWReIV3RrepRmtSQrexE/FOjAOkkbEkkVQQfF9duQHZwPACc3OVDn?=
 =?us-ascii?Q?vOWeD+aLEVj3/r3EdTtWgndzGomPNG4RLQRCrY6SFvvgryvw9GG4lfYSQy/o?=
 =?us-ascii?Q?7uFmulBFN5ATo6SvZ2I4c6Sa6bdL4jAVSyOt8PnYvfBy31oXZX1n1sxiPSN7?=
 =?us-ascii?Q?xJK3aOTzeKkpzxxYNHj6pUZi3Rcm478LpaZXyPE5kJcPi3tx0hqsMVtUYOcX?=
 =?us-ascii?Q?JGzyNeulNd/+NMnlzIHmnvq8LUhzh7B1773crdEnEJquq5/cwEeiLTFblmbs?=
 =?us-ascii?Q?15FrlY2ZJ7gIr03NJFT08zXTXfVi7lWTsqEXorFXo16kcYm8e/Xe+SiDrAmB?=
 =?us-ascii?Q?cxvgn2+KddxOw8kf3vtKhVjgEFH6PMNqEbI85svIB8CVLY8q+j2FUcxARZXJ?=
 =?us-ascii?Q?gMypp9XYcbrDQklCj8IA5gU5ejWHvQf782rIpWOvnLkR6J4R78lJXxcO4fzc?=
 =?us-ascii?Q?48rAkRBK5JqC9f68PE8R99rLX0KqU7sPJtbDVkDKtSxOzQc7O5oFNaPo3PG1?=
 =?us-ascii?Q?z1GC5UEdVxUVXNR43H8XiiWjNYGaWMOB8Gk4cHVuxB14gbMZ0NdUZNpSiPZu?=
 =?us-ascii?Q?USWIEVZ7qSnTdWhPNVpQJ0dI7OGIsxETyhRoRGwOyqEFYfwyP9YUpH5sbXTb?=
 =?us-ascii?Q?bmf6+u+9oM/0JdYUkjDGQGjneYbVsUIyoY9HDINbRbSaDJMxBglmXIrkpm/U?=
 =?us-ascii?Q?SXY34bu/AwUYmfE5Ax3Z0CPRC/AzShI4/+erKa9hCMtG8TdZwQ0sifGdZAla?=
 =?us-ascii?Q?3StZF04egQ8HvQ56n9DGX7c9ODha/9TWFYDp/CK5bKvz2coybhUPMbw2mC9K?=
 =?us-ascii?Q?gnj2B2jjenlxYtCySKr25TCSxr7c66QB22MwrCn0E54bA9E9Iuhf94a3QkT0?=
 =?us-ascii?Q?r+BUQgMFIsFDu+V38KniGrQE89p9LCFhLjLuMcLEXXjJ5rzaRj3f+4rsoMLv?=
 =?us-ascii?Q?vzTiwC6+Xs52oRG209mmP7YPb6WiKRg4tzE88oXz5LigJudH+w+nMrQZqZlZ?=
 =?us-ascii?Q?Vpx17uhTvuhAE4WBBnmIGKw3INFH9Ci9t0n5FC4qdYmXi4aIvhmdI3ATefQG?=
 =?us-ascii?Q?oNgWYfKXy2+SSapYHhCnrBrWAqWYR3TBElfYx1SLNNjMxxONAqbMYQsPGZg1?=
 =?us-ascii?Q?fxONxgLzC5i3TlkfC623RAHx+vNL3cyQv3bHbJI38K9VXhh3oDmmHy1b/GI8?=
 =?us-ascii?Q?r2vgo7k6B5n6EIwVVO9jKH+i3iMkCEIW7NpKAqoglLLJg/spQHQl1P3fuiFr?=
 =?us-ascii?Q?pHpQsPqI4ia88ILL5mhiElY4y2gJaDPRZVycAxGhaVgInfBHYdE0XIgbge2+?=
 =?us-ascii?Q?OdjQO6Tccg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8406.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9daf613-8b63-4a2c-45d0-08df4433cc3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 22:48:57.0414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0SCV4C9IYO0WPpFJy85oPW5pUO7OIeyY3358NnrxTa2BYFOO/SII6K6OfjyVFwnWhcwpYbPcf3c8QVI0l3MJtChORqFRHZdCt9G7BW1DYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7415

On 10/11/2026 18:18, sashiko-bot@kernel.org wrote:
> - [Critical] crypto: cmh: stack overflow in ahash_request_zero() via
>   missing tfm->fb
> - [Medium] crypto: cmh: missing CRYPTO_ALG_ASYNC mask in
>   cmh_aes_aead_init_tfm()

The ccm(aes) fallback mask is fixed for v9.

The overrun needs a caller to pass this cmac(aes) transform to
crypto_hash_digest() or put a request for it on the stack, and nothing
in-tree does: the only caller of crypto_hash_digest() is testmgr, on the
generic implementation it compares against; the HASH_FBREQ_ON_STACK()
users (aspeed, qce) use their own transforms; and the hmac template
rejects a keyed inner hash such as cmac.

Setting ->fb from the driver, as proposed, would have the driver manage
state the crypto core owns, so v9 keeps the driver-allocated fallback.

Alex

** This message and any attachments are for the sole use of the intended re=
cipient(s). It may contain information that is confidential and privileged.=
 If you are not the intended recipient of this message, you are prohibited =
from printing, copying, forwarding or saving it. Please delete the message =
and attachments and notify the sender immediately. **

Rambus Inc.<http://www.rambus.com>
