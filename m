Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794869550;
	b=lQAk3dH0U82UQMP6uzsvQ6SVDhoV5m9ensNAIwQtl7vAyI9coBTb/CzUlKhC+sJj8Yv4
	 90UqPW5DNvXA0Hi/hqfS2YvI/0P3zyhDf16IRZZVK+nSAWSj+X5qlv/6VSAlm1jhRaQTV
	 T3lC5Fh1GIrVBGdPSqCQPMzUMVGjBk0lrvdi9YgMSBh7K4rPxCv53OBLqScmC1UTtqCzy
	 hM9sNsOFNB0SnaP//CXGni9t1sEfpPb8/0X7gfjnlt42/nPPU8Rf9ozjrvJRXTaJxhk0n
	 IfwYFWhSM6ElmSEO7xfA4X1B0BJ0onx6kFICxEJxdyIe+6I+fcaTLPSoW4Z6IW5TQkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869550;
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
	bh=DYWXMc5a3kKQTs84MQIhKM0neu5Fp7sgGwaLUxBsPJ4=;
	b=YmrD1ylZQ5QcdcMxBOipijiWqs0yCGmp9cgILxawKQULg9bRn+7Ru42Eg9mSycP0qJBd
	 2QhAbZrxunt47ny0CnFx08fp93L40ESyCDMNf3LXyD9mYSwiOsmoiMUfEDUDH3pCuHlss
	 OX1draujiIablZFDiiISD/ROg/3vkNiL0/UQ5GZs9VL5lhbqm3pNz4lV9GFATRCajAAoX
	 fp3Ds7MecRgYMsBVyoZv26w/9JkEFPZ9NqHDXulI+iRQck/yNG6gizUl4Pl+b8g5W2RYk
	 tE2NYkbebIp681qc6DVXwVH+1Dd271UeNqtK5EFlKu4RvCNXf6ZmKwlWRpk053rP8ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rambus.com;
	spf=fail smtp.mailfrom=rambus.com;
	dkim=pass header.d=rambus.com header.i=@rambus.com header.a=rsa-sha256 header.s=selector1 header.b=C0h5HZXe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.92
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11021092.outbound.protection.outlook.com [52.101.52.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E65606A323
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 22:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rambus.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=rambus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rambus.com header.i=@rambus.com header.a=rsa-sha256 header.s=selector1 header.b=C0h5HZXe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNrN10wN+W94sIp+RfYG9DeQ+3CDZ/nKRFtSLu5nED3jXkNtnbSZiLKpgEstFBSrtPNx43PRNfziIucK6cHFLUpV9VAjl3FJnOEUODO6wxmN/r2DXyaeYkcI5mXj6WLWpP1dQRwGlwhKJcjKJjNrkQ4rRCtcWGjx1k8l0+DAWkmlzM0KU+fhSBoNEl7KUlSumMFpgHCqmlUvxo073oVLBcPrhwqauAIMxNjymDSiasQF1yVH3A0qfoZgC7f009lANOLYNbTnNuMazbTvO/5JqVJ8VUBschMVaQJD/i6YqQMZKAOxFVOrSdlALwUOC7mWz/w07MJ8PBm7PCXcLnD5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYWXMc5a3kKQTs84MQIhKM0neu5Fp7sgGwaLUxBsPJ4=;
 b=m9GPJk3tCg7kpogzsZ2kMkKJc5cQPIH9nUP6jm+kgq84/Nu9MHoU9jpZI/kubqyvUMf20/6x26FAKGNb1FmJa6kdip7sf60b8cM6e4TZFmjm4cgKQ2z8Hj99ZxcrLD882y31p6KDbZVtXM5D+9CjAB/ziJEhQP9F210afEvktP8bXuchosyAQj4NrdYmP5pL54ophcrYXhnEGuNp7d7xIVQUq4AzyDNaEeISsYj+R2AJQ12fzpPe4eZCrg1GnkxJKgia5SFdBJzh9y4wf4tFxMaiCS0F8YkmurZ/pvoiAyPNcwclBDrPyMpMwuNucDt+fw9VG5Vj+NGFigRh8t4elg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYWXMc5a3kKQTs84MQIhKM0neu5Fp7sgGwaLUxBsPJ4=;
 b=C0h5HZXeAyhpD7NtBC0tt1lHwYlsRdoilKNyjg94y6hG/xw8seY9Px/eJE2p9VvFNWsP7Bn3HAsae/ltdFyi4Wg4WSaxad2Dem4I6hbLIdqWVLuRFHztezSgqdjMTzYWlZbkPJWcMRRxU4NqhZ73VEXbbaLv/1W3DanUGMkJUXmHIrp93PJ6aHrVjuwiApnvKMhsTNsifg10RjV74DwBjS+9MbpCzF3RAZfW5x1GO/m/UQ09hwV5YWZ3ufBAphLB82/A7i7U7muZcl6LQy+K6HBjopcSRSt1lej2pA33a5Xhyssa4e3a06JJ52pGF/j33IS1jDQhryhKNxQlPSe8zA==
Received: from SJ0PR04MB8406.namprd04.prod.outlook.com (2603:10b6:a03:3d3::14)
 by PH0PR04MB7415.namprd04.prod.outlook.com (2603:10b6:510:18::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 22:52:27 +0000
Received: from SJ0PR04MB8406.namprd04.prod.outlook.com
 ([fe80::cbad:dfcc:82:7dbf]) by SJ0PR04MB8406.namprd04.prod.outlook.com
 ([fe80::cbad:dfcc:82:7dbf%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 22:52:26 +0000
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
Subject: RE: [PATCH v8 2/5] crypto: cmh - add core platform driver
Thread-Topic: [PATCH v8 2/5] crypto: cmh - add core platform driver
Thread-Index: AQHdcTPv3CpPtr8Hb0SYqB37I1+L6bcnlZGAgAnBluA=
Date: Mon, 16 Nov 2026 22:52:26 +0000
Message-ID:
 <SJ0PR04MB84066047ADAB0F643E908AF1D77C2@SJ0PR04MB8406.namprd04.prod.outlook.com>
References: <20261110-cmh-b4-a-v8-v8-0-4cea8ebc1d40@rambus.com>
 <20261110-cmh-b4-a-v8-v8-2-4cea8ebc1d40@rambus.com>
 <sashiko-outbox-207521@kernel.org>
In-Reply-To: <sashiko-outbox-207521@kernel.org>
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
x-ms-office365-filtering-correlation-id: be2de984-d634-449c-551d-08df4434494c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|22082099003|261009223027099003|3023799007|921020|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261022113327099003|38070700021;
x-microsoft-antispam-message-info:
 IYlzFVytNde1PotF08R6DY6LNekAFqLDwls71fnX3K5EwrhGYSLY1ZqoADjFmmeqzLLD2DpClIGLIZuYN0O77AG3DTiQJDGGr/eRw08EEs8uDHdiwKgCZNcebLDUeHXCIwJ7v9xcBxpFG1SYGHpqTja4+0WlTYVmxAoJlxJYMWTbSVkbPjkVLogIhpS1AkifISk1sxcfBymBbhh4NB/QlmKR7GT+wgkLINe/84qIMKPIGciVIKfel5xhsVlS+f20m9sJC5DmE1aId56TBxMCkRSZeHdcSGu8NSONg4HnYoxia/wFlNivx1udyQDR+S+YnqTvDacToVwtVHnr/CVTWMrMLsrQvYYrP15XnOY3KaJEBQBruX1CEzteod6jHDpkUVfHZ1bwqUyx0C2ohOhxAsC8jF86GDF2Uh5zhGyMgv28XbTGV7R/0roIqluDWl71OUbT75ppGM8nkyySAlpsvzWClbfqTZ7q3+r1t+xaOuDNrdfIK4EU3yyyaKBsHdCDWm8p8m1tEQvhmpTNzw77yQdmd1Avgf3+Ux+pjkGRNkJg4QZ55z7407Jqf8AxB9cDAKT0sihhY3PkJK+9Ezln/U1TIVxZrGsvz4dNbQ5+alBIoWqQFEKbeIawBxZOECQBVeWgrNyPc5HcXjSA18joxEa62t8uxB/Rv4HGt/N7GiFFOJJwznkktClBhlBqk6CadoeThg3GMRe+IFZhll14gFp7M/w0oWQB9i762DAPnmO40QxABINj47OSGI5dWviU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR04MB8406.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(3023799007)(921020)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261022113327099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LPgeTijMNn1EwP+COtEqdTvmrVuHpSzoCPP1y0vIo0wJlvlP05/K3QZpX/ZQ?=
 =?us-ascii?Q?AU68vqBjRpLftB7/8CeML/7MBpEcE2QuVU+cJsskkEe+1FMJ6nxVzkW8owHR?=
 =?us-ascii?Q?hNxICz/X1980A4tR8XSJ3zmV2NL0MGlQTO6/mKlstCt0jQbeXv/0b/z2FHM2?=
 =?us-ascii?Q?xsmP7eveIVLIhMGrXsSF7129IEM83rhO6QxBX9cwZQ43I/228uI5wDm8XdIp?=
 =?us-ascii?Q?+zMkejzafT+SCYlBytXXkxyUyNaT9+rMgiswxty/9ZFCcL63X5Dq9XnXB7XL?=
 =?us-ascii?Q?a6KN3UpVhJO/3lIuJyc1ekp8rUti/78aI34iGPi0CjmSwXbnXslvldRRCvrz?=
 =?us-ascii?Q?zBMNnT4cgIslan9M34XViKgAIhQral2+eP0ZRhwm7h/2W5EnnJlHa+lYjR+G?=
 =?us-ascii?Q?szFqQM3Lbu4YveWLT2DH9manlq/oxJfQDGSch3CrBUSezCvo5fEDOSLaZaZQ?=
 =?us-ascii?Q?wu1mjpbARYuOmMN6b64ySDF0j+J5+Q/NPRixrxL11SRZE5IyL7YjK46KFowC?=
 =?us-ascii?Q?wQQtee65yCiUxkS2AILo6Wlj4WEo0NJXhx4BlTVM8lvRewqJPjse1t5X/swJ?=
 =?us-ascii?Q?H/YxFhU2h/ztHvukB9qC8sRKNbB2Fhh3VT5JnQloKvjz/C7dLNCVeUKNKbqg?=
 =?us-ascii?Q?Rblt0o6RXD1acVxPXUZwkhUbF18FaFJGQbPNrBnXsiD2md0CdniVesqjAE0t?=
 =?us-ascii?Q?H8w4c/21B0QiTDqyT9K9wFb2zdgY9ivF1+WzGqCUY0FavXTv4cP2bKrnmb0I?=
 =?us-ascii?Q?xJuK+l1G8rkl726gg0wLB8BJGui94GzU5SVSQRfWGld2BepfbKEPylcNsnWt?=
 =?us-ascii?Q?Z67GbINYKR+emjE1Zr+a5610+cpcPbFV0QvU3CqJJZAlK6n6hCjzYjghp761?=
 =?us-ascii?Q?5fSBK90FL8s7m1HPkVwTqbBYKrubTJri824j9w8KgDwiFraZKmzIC5ODgU7U?=
 =?us-ascii?Q?0OLGO5cY80H5qdCrHjJspzCrCajfRWlXqnMBmOOqCjCKKYIEoV/b59QhGl/q?=
 =?us-ascii?Q?mw0wFxPJ7oUBAevklNOAR6SpO5ZcOOQXfFuuFtiQa6F4erSnnmbVx2q/WCWM?=
 =?us-ascii?Q?bQxjlmXft0lLOFjhCdG8kGqP78B9psYhNwIWKJUZVPgdz1kJVo3X7t78byco?=
 =?us-ascii?Q?0EoBqZdk03eSwUU90LjQHloDayVZjLeIKeKN906a/haA81Z+mEcMzAZRHL00?=
 =?us-ascii?Q?DWLAYPDhtxR6lRp38fuc/Hag0H2TWo+3Wqbj3DmZ0xI+PjVdOaa6vWW6PJHv?=
 =?us-ascii?Q?UnN27NgWPXyOzuxXraSTyr2AWqlMB1coxx+i0ijByKZgzTvUgC0WCerjoueh?=
 =?us-ascii?Q?dvjoboq4b+Oa+2Hfxov8AASxwMpmEuIgK2h9iAfjw4rEaDX135xQc83gTByt?=
 =?us-ascii?Q?gHudTRt4b4zcSoN7HvoHy2yTKXjq09NPyBrtiRG4JX4zkP1e0GL1MRd7TmMo?=
 =?us-ascii?Q?yj/mbCbkGHLzBwJC7ta2ZkHvQBbv2Le1ZAdCfslAMtOUVhh2zI+lmIETWgKV?=
 =?us-ascii?Q?Z4tNP5DmqOlBhypHv0Rcy1FPFJc0xohSJtElJJKXxkNsqm64A7Tfe//S7fcc?=
 =?us-ascii?Q?4ULydHhE8mlgx2t3mGlkXxNxmr9V5TrStftQezABO0CCKG3ouB/NKiqEoG8C?=
 =?us-ascii?Q?dTFJdKpGx6aj6SiiJbckqaMKG40kPNnRcSZPF8AHVIF3vpTvGyC5Bjbipjoi?=
 =?us-ascii?Q?uSU9WCaZWRoiNI4pbBbFjSnokYlYNmk1LiQC8hJXxsqmAGC8MEwPwFNlIJnK?=
 =?us-ascii?Q?6r5MoQHOjw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: be2de984-d634-449c-551d-08df4434494c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 22:52:26.8606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxjDSZq5H4R/RFsKaPyjhkNud2SuNQtGyp7OLEmtf218RIiKT9J/uUQC6lu4avZMyE6J00omjAiIQuungHtWi505NxnU/f1ULcdMTOyyb04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7415

On 10/11/2026 17:50, sashiko-bot@kernel.org wrote:
> - [High] crypto: cmh - race in cmh_tm_try_cancel_command() during CMQ
>   backoff
> - [High] crypto: cmh - unaborted sync timeouts and missing watchdog
>   escalation
[...]

These are addressed for v9, apart from the two points at the end

Cancelling a timed-out synchronous command is now decided under the
command-queue lock, so a command the transaction manager holds is
finished undispatched instead of being submitted later.  Commands
submitted with cmh_tm_submit_sync_tmo() carry their timeout, so the
watchdog escalates them on the device.

The recovery findings (FLUSH/RESTART reissue, FLUSH on an error with an
empty queue, wedged mailboxes skipped, last_head and abort-stall
tracking, the probe/teardown FLUSH), the dma_live and quarantine ones,
and the completion counter are fixed as reported.

Suspend with recovery pending waits for the mailbox's requests like any
other, and the watchdog resumes the recovery after resume.  A
synchronous command cancelled before dispatch still returns -ETIMEDOUT.

Alex

** This message and any attachments are for the sole use of the intended re=
cipient(s). It may contain information that is confidential and privileged.=
 If you are not the intended recipient of this message, you are prohibited =
from printing, copying, forwarding or saving it. Please delete the message =
and attachments and notify the sender immediately. **

Rambus Inc.<http://www.rambus.com>
