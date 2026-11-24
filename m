Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795483591;
	b=rE8wXunYtfkOdrDW3mMTrgG+MzbZSLGZns0yM0nHCnVhZ743CdxQI+r+lLZvbRDeOOjC
	 xP5p2lvQKp4gYQJkh5udHw9uUSATMXFiX6pJTvANUo3wam/xA407Zhky6PwHWKyMIf+iY
	 wtLFZWYPNb2UWLZJ7npuiStWKVqoLqdi+GwE6I1Z2qcUptK1PS42SIlbUTWtYuoiqoTNN
	 1tu/WnU9en5SPMDuj7shUg+OEDuDnB/Cc7UR7xUaHZnzphQll5NDsh/hi4eQNLaTTIc0C
	 yrgvJnkYhLz8QNJ9pSSzE498erikZDt+/ogHHMdqeEu0/0+nKoD0mUL8zFhXziL7bfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483591;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=u4MJH2ush/WFide0ZqkHUXcN0mAQgf7gzHW1ZZ/Evzg=;
	b=tGaX/ZkJtO++Du3JYgP2eHbLS8gPabeSC9dlPYeL7uQ6ChmV11wcsq5j5dQ4VhAW7Hdm
	 AdsTKOv6y9v0EjzxRaIoFoNurYeU07WAnWekJaRfbhWSRVozOLxWOAyjOSGHYgx3pCL4V
	 DUJoj/btVcw4/Jc+Md6kFePpEV3BPyEe8Sp3InpkGD4rE/HaZFCjFOW6bzWnnkUv/oKrX
	 80IC3frfbl9LmjKeoEwrst7lYWiv29unVeAt7M6BGnQRaCm7Eqp9JhWgTrMVtOlXlniTp
	 Ndb0/dvJ09imwG7feqLbCCW29psD7lPqn6ybtabptCt8VxSsHYT1+ynk6BizrU0jZfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=oZZNxNpD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.81
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022081.outbound.protection.outlook.com [40.107.43.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F2B606A321;
	Tue, 24 Nov 2026 01:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35F2B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=oZZNxNpD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm7FCjoSrS0uGBqDuIPwT1KijotEmSGkEnzw63h5tqbP4XQocHTu2Nx53jACxSktGbMH8MMwLWB/86Znaq3Yv5p76ra8+SxlIxAGWO3JTvxgueKgJ43GPX1cDgNp+YNQvPZN6eg5GQDu5+KJ0BKC1QnN2/+t2E0A0wgygduhOAmID9SypEPBw2b1SytAg6lAmQmjlS+vxH4AvCW2C+iazLMgwEPzM0yrQsbwLFlwJ5fNAqREaMLBg7yKvZQhbKw1ylxq+yEyHjLFVr2cIn/7+oJ48kWd+lI3+ZAkSRJI7FNthc8PTAFa45h0iSfndno099Gn0zYFservxEXnZkln/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4MJH2ush/WFide0ZqkHUXcN0mAQgf7gzHW1ZZ/Evzg=;
 b=Ux53EjRtyz4iQsSYRKR8KlTD3TXXG0J81qdSQG2xe9lMvZJdWZ6gcT+zCkCX+hhTxe1C6Jpa0y4HmKn36Q8dEe3RyuFEgvynY/tyVcE33CRsEsZxdC6MfcMAwRqc5e+qxKau6IiC0RvreQgn9v7dNiyqEJoRlyibbB+P8AkShrdVomYCdTnclTzLyQcwZRF4Cv/3agN8LYhIxcPsvmdk1aiM0FXjyvTHadsP6bc1TwXO4n/d9TfshVyn1+fk9j4NUY4paiLL2HKimabFsTq4qnm/3myqhyzfdiJVe+AEi8kdXJ6ZZ1jHsV5Kd1khAZaDMKdzFiKjSMsujXBMsXDAaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4MJH2ush/WFide0ZqkHUXcN0mAQgf7gzHW1ZZ/Evzg=;
 b=oZZNxNpDWj9qpZ5De3AoxG4T0+NvG3tlWn75E3yIn/Apb18sod6s1O0u+5qIfvpM6dqqR+UR2JYo7WvcZ2nq5eQb/ZG9OfD622AzQB3eyA5JSuNba+o0kXlf+b5t3n5CIk63dHpuieoNOgGm41pcN+h3Lu9QYLDUPskvMz6BhqxX0iKEyIftaTDw/pLd4CtllA1lcinIZ1sxHx6dz1D6wHLtEmjadmdDN4vxVP9nSLXlTU2gZVkuM/lMi4JzE7IoDUDgwToTidRF41FGJ7d82jMZOTJwWGVkjeUdi5+MrpSKv8AyIhsrNFMwAYNz7PgXvW+LuzQ/xUY6GpNFisBOvw==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB2276.KORP216.PROD.OUTLOOK.COM (2603:1096:101:154::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 01:26:27 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 01:26:27 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Frank Li <Frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, "media-ci@linuxtv.org"
	<media-ci@linuxtv.org>
Subject: RE: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Topic: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Index: AQHdeARozyfnwPkovUOydj9BJXEYp7c1IA+AgACqeICABqmSMA==
Date: Tue, 24 Nov 2026 01:26:26 +0000
Message-ID:
 <SL2P216MB2441C0ACC583AB423A29EA76FB442@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
 <sashiko-outbox-222830@kernel.org> <av9Pwfx0wjfjw36L@SMW015318>
In-Reply-To: <av9Pwfx0wjfjw36L@SMW015318>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SL2P216MB2276:EE_
x-ms-office365-filtering-correlation-id: 768cdc2d-37fe-4e54-cbba-08df49c9f5bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|4143699003|56012099006|261009223027099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261102123227099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 Y1H53XliVABO5+OMD1s8TtkIyt75VqL70nFjNicSwyP0Tz28TqH43jX9hQvaeKFUVDkun5B5R+qgHQkOiDfA3FdOSaqzLQgTSySMp8dEolghJlc/TqZvCcRs+3R4/NrwomcghPN94isFTHz7zO3t/u6dhhrTjWqBAB0NmXKXMWpjvDjP3wIW1/aO85xmu9OVrAKoVnMeji2a/u2Z6NtNzXgNSp9I6HEHcvKCWrn6jBPv/EFo9C04vmDtm9aZ9Nbe1GAiusPbTVLgxSxVU9ldzEsH+2ulJD6cShthod94qOji/pL5cTyxECAyWFTOkTFxUqGV8eCKDF5Qd5gMgu2cdmTgZluBXmeJxYcLMi33wnM+QfFjucTEx+yODUWZOtpBUV+qad+XylSY3CpQ5W+8zBDXGNDlcyHDesJdbudKKsF5YqL+pMWKmYKVt58u5+UoPvH/h4gvbofAW4BZXPci7gxDXP1243I7LnqEffW+WzP26CalSJFmwTlAkD3//n5H/4W7JpRQz2rEoir3LlfB38MpC7pdFv4X0kZyOArzKTAfNju/TMRkkAC5snWTdx6n5St9sMW1x0V4g6LrjdQknPMdQv7uzJH271cfla/Zu+AkEHLGwOI7T/pcBBReJ0lm4WfL2ADrvY3r2V4SNBOujAtS7K6IEbj696cxUbafitbvWnPqzRIkl1AhPNd2qJQmw4vZGqh33+ZM+ybJl15ezyZkxUMq9EnkFFHjzBkbXvM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261102123227099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wUBrrrXYYr5Hh2Cs/bwYNyXXc1f/Z6Yaa+tbZV2bogefEr1uret3unVB3AUu?=
 =?us-ascii?Q?DW0hsbD7sx1mbbyzYvskoY5dCUTshwAaCzErPmdf8+QwHU05HHEQQygYBIjj?=
 =?us-ascii?Q?ORK96FGuBwwtRqmlg2pKjMbSjV/EIhzE0lfv6KH7vLCmqbijaLF5SLvfaSSj?=
 =?us-ascii?Q?CGkXwnvqDS66bp+b4O78uskBjRpjdNUrnM328D3p9T8n2fAEJXs4Sq6lb0y+?=
 =?us-ascii?Q?IGf81HfLe2lWNLVDQC1Irx8OOh27AxebHMeCZ3pEKgT25MLJa4CyOp9OyLLW?=
 =?us-ascii?Q?Z89C9vTKHrBIPMVL+Awa1TJKUnpGKwnePnGBtjUl5c8RdFdXlAJ2hJg80iw1?=
 =?us-ascii?Q?5d9b+uVzRYF4U8IaN0rlla64ECOcl58P2CYG8fVwwd1CiHH2YPIO33TyHTm4?=
 =?us-ascii?Q?MjvCGyj6464p6cXEEOWQ4/7dM81bni56soMev2WXa75b1VHOhb5NiUDq7WmL?=
 =?us-ascii?Q?1LSbpmpOkoygYZuusihIV2RO7LOosdcOyXDAfFcfAInvGSG9QZySYrXcAqMC?=
 =?us-ascii?Q?Vl8d6bzPS/ufG65vQAvxrLy32Fo6P8L538H81Tbxd+VTJ9+cZrjN6Dkja+GJ?=
 =?us-ascii?Q?oQxWo7dUV+0s1EZ9OMczv28HjPrU2DqQw85C68tSptmIhBzA/5dMmzW2+tVl?=
 =?us-ascii?Q?Sk4e89FYDTdBWVBXDH0RWvuRNcWOcs389OyPZPYpEI3d+wzLLgGX7QFB2OOe?=
 =?us-ascii?Q?nEGK0xrOiCRF5Ng4YAopa7iDR/VLhKtRL/9IcNxnaTM9f63xzfj1leBt7Pjb?=
 =?us-ascii?Q?c4jZ842tmn9H395P1GCkOZS+ILXQbKtJODkU16vDS1+klESvxcF4IJLXvfoP?=
 =?us-ascii?Q?O2wrcYg0zoLoElr9DeEWbc5bEohCRRAJ0oiFsf1Dh+r6+pGi+Fo+xJLxP8BD?=
 =?us-ascii?Q?Xmb+HKbIrKlAh6YeRSQnE6gdrg6PmcSFE23H/ydMQdTOuCYYsFrMAM4lVYll?=
 =?us-ascii?Q?z9XdTzoS8gAQd+luU5XhaFHNe4oRD3SwKHCMKHS89llIrxwhx3lmrXpu6uf8?=
 =?us-ascii?Q?7fMWnyrXYnuRGNu9D9PRcTElHnfHk0XdcljYY1XB8vygLnjRIHW7SZI2/BHu?=
 =?us-ascii?Q?uUQ8Blxy5qESg99HaXi5SG3Pvaa6lNh0i+2M9vHNXLmWxuqOV1WoiiFfwP7G?=
 =?us-ascii?Q?HGEpXV/+SU6KpS/0P+qX1xZAd0tZVgMsP4w0jWy78tTzsretFGaN1sR+c7gE?=
 =?us-ascii?Q?klblOUvgPPvLnGZiceCOXb2PBkE3vIVZC9P2cl5WvP09qhZ68Tr2mez5U3RY?=
 =?us-ascii?Q?lx1cvR/YRs5tL3PLwCMo9aLWINgkVOuc+k52E59u+bYDJnbH7ImhTzvh4SOb?=
 =?us-ascii?Q?TLex0TSqMHjURWLL980TEskhXHHF98aFFKfy7oLxXALC2+ljw6LMRewNgpnu?=
 =?us-ascii?Q?XGMKtTjQzQz4DtYuQbr7Qur/bQ0nmqTouNzhUnP56UVGibFYYDE83bLHkQMj?=
 =?us-ascii?Q?G14Dnq14VoptsEQ2STODfuf9LirfsrKzjwvlT01RJyGUr6FqRxpd0U/mulmz?=
 =?us-ascii?Q?pXwzhUnTBA3FQKj+kIVWHx7ndPZBoPB/Syj5t+rGEnaQlklkYsnUB/0P+R1S?=
 =?us-ascii?Q?JhB9ymkzIf7Gv8nHebF5iq9VnGBQnZ42N0UpwTGKMrSFO0qV1PlVqogUx7eb?=
 =?us-ascii?Q?LSN422MP+qLmPGYMpG1vkHH5Zdq09uFIzFrjmI484QalgXoMPngNjGzwnKnb?=
 =?us-ascii?Q?9a29A13t97/zwbz7PJDqKNei9A08M7BM/hQDXtZo/kihsFjOhZv+9yhvxN9O?=
 =?us-ascii?Q?ZY8c6e00cA=3D=3D?=
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
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 768cdc2d-37fe-4e54-cbba-08df49c9f5bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 01:26:26.9289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oUK7YI6WBnaLXFFnt888MCqoCGH3+HFpUMBwTB2+QsijeIxbUMi4oxYKlLocpngR+wpJjPH+oie2WQ0DZuV8NFoI4RqWryZjfJm7QMRIrY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2276

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Friday, November 20, 2026 4:37 AM
>To: sashiko-reviews@lists.linux.dev
>Cc: Nas Chung <nas.chung@chipsnmedia.com>; devicetree@vger.kernel.org;
>imx@lists.linux.dev; robh@kernel.org; conor+dt@kernel.org;
>Frank.Li@kernel.org; media-ci@linuxtv.org
>Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
>driver
>
>On Thu, Nov 19, 2026 at 09:26:25AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 8 potential
>> issues to consider:
>> - [High] media: wave6: vpu->lock held across core device register and
>>   unregister

The core runtime PM callbacks take vpu->lock only while an instance
is open on that core. A core being registered has no instance yet,
and cores are unregistered only from the parent remove, which cannot
run while a file handle is open. So the reverse order cannot happen.

>> - [High] media: wave6: data race on work_buffers_avail in
>>   wave6_vpu_require_work_buffer()

The firmware keeps one work buffer request outstanding at a time: it
waits for the driver to ack the size register before it raises the
next one. So the handler never runs on two cores at once.

>> - [Medium] media: wave6: stuck PREPARE state on work buf error in
>>   wave6_vpu_init_vpu()
>> - [Medium] media: wave6: incompatible phys_addr_t pointer in
>>   wave6_vpu_probe()
>> - [Medium] media: wave6: wave6_vpu_probe() succeeds without required
>>   memory-region
>> - [Medium] media: wave6: wrong product code value for WAVE677_CODE

Will fix in v9.

Thanks.
Nas.

>
>Please fix above issues
>
>Frank
>
