Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021089.outbound.protection.outlook.com [40.107.42.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B99B265623
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546905; cv=fail; b=jwvIMk7F0PvBo2mt92LleTnmpJeqvs7+E67S1CJpcOKNFLyWlLwCk5hI58Zberiyl9mnkpLfWoB3p6o0Dq1OM+to8/IXjyHqyQk0qAf0XTrFXr+bSgX62L6vjwezq1e448zZbstU4rf6gvAVg7KsxLmCTCtA8krEOgZ1TW66I9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546905; c=relaxed/simple;
	bh=f1ZOinIiEPqb+0v+PoolYtL756s7OvWv7YDWiueucmw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GAJfQ6sai/qpHoJCId1DkcRGtuMfvCSTjZemYRxv0yiRcnhfpW547bUgvY8jV4CfqZfj9y5AlaapaDSRqruiU2kUOGhgzkJa/coA9JsOBVCQkU2hmVENOSSeYMuatijV1IFGaC7jptbWrUBgj4jrZrfTpKX3QTDOzrz7syTZzsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=H6JVAqzD; arc=fail smtp.client-ip=40.107.42.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="H6JVAqzD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoP5XK+FWjLqzX5gTzMMMPv5bHTmE95Kf3ZctI+huYeruKFHeeo80SMaJzqgLO3nVRiMnqZsykd/z+guuMvmsWNav/imCYIYHfrguke+dzP3Zwfdja8g4bo0WGdNSRaTPqS+ZlfZ0O+2bCjF8vVNyNN95PBHeWAO9wm0eGgLUbmLNyRjhAn7KKg7C/s5cJbAW462bt3QyL5dwN06sDMN5ea9ODm7dLCVLgLXANNcy2Zbpyf7rmcF4ZApfP0RSS2uHxBr1jZhJqO1U6NijFmS1dxMmjSlyolzP+8Rzh2/HAFFgdIfA/ieB4FidUUrcsTIeRVwNgj6JukuPfXQ1f48lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Y0/WpahdUmAEAV0L93Yw8nkKu/ecCm0U1UHeUcUXms=;
 b=X/Q43/KWHyyVdTq7TDajJ2omfpHaSY9lS5PETUeVAt0+zikmlyOOcWWAqJ3LiEyletDbaTOs1gkqvN4CrVOfMAkPXUHMLUbgFJrRuGw45yu3+fxKA40eHgJc+rfSbsfVuQvhAE0m63qDd+pE7ccRuxcPUsB3zGn07UluGqcffkwbDhBuA7iVRA5agDHlUheUt0Q87T9PZk4UlN0HIh/DAyQgg7/GUhr+N5ny6e+sHYnOU9tDkwk3gIyMU6+xzlSHB2tno1BSPH+hs3XxPcoJYTvjxB0067ZPCV4fPhoG830oxCWJzv/ILoV7uhsN2NaCzRPpx/AuUdllpWOTQoVYIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y0/WpahdUmAEAV0L93Yw8nkKu/ecCm0U1UHeUcUXms=;
 b=H6JVAqzDL+2+JcXUYWPvCrBFmkAdJiHxWIt7wSDnW5iGVcj0JVc602Qq2xNJlFW3th6Q4tCwkX0JsRPqKgEGbLD+YdONjwUIcLjyeHNmV/TqNRyVPCbpgPX8Fil5gzzahWODMNxrtXfj3xPXdD/hjV4PqG/POYq59ZLeAuCXHt4dD9HbcHP9eGzD+WQiA+V4/yVc2UHVV0rlp0prAdbufU/4d8svBAndPNpYtg4Z96roLUka1Vj/8xsn0cuBJQB5Qo209STRbVk5LWHScbFvaJcpTvmYrvfu2cO/EFYUmcpsHCPSny6AxDrdWLnWq/2aJRJM53Hg3bOU5P0bjWgGpQ==
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c8::6)
 by SEWP216MB815443.KORP216.PROD.OUTLOOK.COM (2603:1096:101:309::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 08:21:27 +0000
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3]) by SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 08:21:27 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "media-ci@linuxtv.org"
	<media-ci@linuxtv.org>, "robh@kernel.org" <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v7 7/9] media: chips-media: wave6: Add Wave6 thermal
 cooling device
Thread-Topic: [PATCH v7 7/9] media: chips-media: wave6: Add Wave6 thermal
 cooling device
Thread-Index: AQHdPDktirYiArw6eU+sdFaEw4jZqra9/ZuAgBLo0uA=
Date: Wed, 16 Sep 2026 08:21:27 +0000
Message-ID:
 <SE2P216MB2440BB4BE20F183622B87107FBB92@SE2P216MB2440.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e3cb770b50ce5932f0ec0ed25419cd8271a04780.1788496816.git.nas.chung@chipsnmedia.com>
 <20260904070011.E61AF1F00A3E@smtp.kernel.org>
In-Reply-To: <20260904070011.E61AF1F00A3E@smtp.kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE2P216MB2440:EE_|SEWP216MB815443:EE_
x-ms-office365-filtering-correlation-id: 66803184-128a-42fb-9192-08df13cb810d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|38070700021|56012099006|10067099003|3023799007|4143699003;
x-microsoft-antispam-message-info:
 YFGAsiznsZXQRKAs7JC0s98vk1vGkGGLLfzOS+jE72LAACmSJwyCGJCfkTTI/yfuyBgAhuGpNMeiT+CWzCZhTjYWKZB/ZrNLYGMqWebKSukmQHJzRsiphEiIn2lyUfxqrKjFCv2WlgHnlRZQcf99vTetRMD0d6IRbv/UtXIDtTydYSZmeK4c39hsHTQRTlEGFyzXgw2m8si3OpmDGfDdoinh8sTWGkAGBEPrTmWHNGLdbQPrl28HE5SCLRDjfn5bEiv45VYJoG+So7p1yEHYOpU8EWQtIlNX2IB8Pqxso4RpuYH5gTEEXYWG6MqVh+qbrfDikixQVIh5RCvDo88vW+gaMVUfxp1jQiiwCrFllHHSmqk7psZUc4VtWO5XW5BrnrEyWaI9KKLxO9VqU6G92Zar4z97tv39231xFbi6VAIn3yywSgDA4bvfJsciHly68/SjNxzbLm+TaLzTvkzoSZ8Zm8RqkgSD00kDrr3JFdnpFyuE4o5DZezXZTtgrtm/rW43vbRq6fkextkJ2MTeFSV6BXicgIOVFV2OYvLm2ZgA/orTLvNk3TbClkqfqYODkJ9eZp3TGsrKeqnSEpGnerSlToOdxLjVpZoBmq1Kn1LvIcnAeXjZq0PPLLbVhgCb3flftONcm5R5iGXjqOSv8WAlwHGIGEUPThrLzbCB9yg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2440.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(56012099006)(10067099003)(3023799007)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EHBD8HKtoq6EJ1zDKNssgvui5Mmpx0prqC3r45kyMDRnQW95LhKTA8wISvBN?=
 =?us-ascii?Q?BIWRwqmWhmqMX8WKdXk335mP6TnfgG0uEyc+asBZMUFrw6sqMvlLC60qF7/1?=
 =?us-ascii?Q?8M/zEbgueYTW0TYOwo+9OQqmBfhyQYkuOHS10uVjqjStGihb0ocR92e+l0cJ?=
 =?us-ascii?Q?5qldELaliT2jiae3BKZZzGjzBtuuyKWjITiUZJx7++1/huMGvU3kvPxXubVi?=
 =?us-ascii?Q?ey1G4x04G5/St0JClWDHAnmT11envae5qqY//AxZ0Xl9KWGK4Rb9+jElraDs?=
 =?us-ascii?Q?nmklVXL5iwcDfeWVtZlEMEk/p0EMgau9onW78IoO96XC+1AeFTiQiMFQED2T?=
 =?us-ascii?Q?Di4V10ydKAVKCkSdWJ2J4+RX9SGxZp0FKGJtJx9x6cvBmIpx2+/wI/RVk1ns?=
 =?us-ascii?Q?rL1crL+k/+uyvvrvWHohahHDjqkPV35TYe5PbCjbrgK8bttlfHN5rA5eI+18?=
 =?us-ascii?Q?n8ksG/WMN8+O57jCd+ehzB9rStyS1KIum8Uk5SFjNjI3+7LuKDgLmyfXF0gu?=
 =?us-ascii?Q?s5OwfUtrx/t/K5/7l1la+ZH8j1eRsfUFXMW6iiPgJuSjA9powB3JzdgkZuQe?=
 =?us-ascii?Q?crmsTSE7ZfPTyH8KKRJLl4EFRJ6+3xmNuOjxbipGWLYRnzfyaLkPuom6NyEo?=
 =?us-ascii?Q?HcA5RhXaggylyj4Mf/plAjBZZVlMloHEDPVDzUlwey4NlfHhzj7YOXWxpVP+?=
 =?us-ascii?Q?lNVsFSNAJjrwG35i7z0rWR1JkBT8oId3cT6h5HNhT9oXg6r4WOnyweA3flBt?=
 =?us-ascii?Q?BIvDdCh6Qq6CERstjhtcHIq4hoi2N66nBJ4x5tHZO84EJURLIP2huqGIMFZH?=
 =?us-ascii?Q?AlUcuySoq0fyCVBjq7umnZ7Dkd8s1204frijDc6/3mB1EJ6Scq/aazxw2GPl?=
 =?us-ascii?Q?GHzW9tw2sLHa13d7Mj7jNTZ5M7ctSzEMGe/XH54/7TpmbXCt5PzL3m48qsWw?=
 =?us-ascii?Q?awsqSef5a+/feW/Q6PdTdTsqV2sGPYMMWhAwZ3jlu3oeZhriE3rWYmmVfwD1?=
 =?us-ascii?Q?6BWM2eoicr62ifxGUOebW8AtZfmfae86EddirnluKlBgYFdSOXwTOgRpBpXE?=
 =?us-ascii?Q?8oVnWm2fYHWzWa8Xz31sMK2qdyjsaxUnvr/db4gzkBFE8BnGh9AQgBoPapYT?=
 =?us-ascii?Q?EFo99JsvMl7LQ6VBnisgrqx5DrqkPIlGZXdT2MDlEYm2cUlKAnZSCgg6LRuX?=
 =?us-ascii?Q?fJE+/R764XPbDpJ6gVC/Q3BnMC0lsUJxU+2DWZpxwcPornHR9r/LU71y7HnO?=
 =?us-ascii?Q?FeyA/ZmKtnGZxugDZ52duTbIfaie0j7+9QCS1nOR/9v2bU/i60V61v+LkuXL?=
 =?us-ascii?Q?JdGBv2qgKH0Olp9QGXmLw3JjJ8pEmWqe3d5MopNPsOJ+Fi7Hg1J0rSsDn+bT?=
 =?us-ascii?Q?+BThXT4kZHlmukQfufDma20FVrR5znJE6iyUfMhWvNa3lN1rcBtvcetTltK7?=
 =?us-ascii?Q?CfxTQfSLz38N6GhAZgyOgNBmqbNESYCU676tZemD8h70mARM8Z0bjfLBo9c/?=
 =?us-ascii?Q?qoE11ljkrYwWbWeyudZQsyQPHmmTinCfuwgkgKkszNmQHXL7uUjuQwBmxWTA?=
 =?us-ascii?Q?20IYE9f28Ov+oKPlj8FOycAHqj8Is8LkiN1KSwrhUV2asOKcpBkbpzlL6Wnt?=
 =?us-ascii?Q?4AOp6cdNJzG//tqZOPEEGzvqs1EEr7s56/iaZMXXdPgi8q/esrpateGxv3B3?=
 =?us-ascii?Q?rugLL2d2DsSD3ZlMb4oSDpSUiE3NfL1i67Rr7K705IGkuvYzsL7/XGTimxsi?=
 =?us-ascii?Q?IG/2bIdofw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 66803184-128a-42fb-9192-08df13cb810d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 08:21:27.3889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrj+58Qb0BVF0xnWHYM00zvjMrMaA3mJuXuHcsRUP0LGMJiTlL2aUFOVl6Yxyr03oQHu9UbuuinDn2mDjCNGOegiGr6U3coWD2wzwRzOGzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB815443

Hi,

>-----Original Message-----
>From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
>Sent: Friday, September 4, 2026 4:00 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: conor+dt@kernel.org; media-ci@linuxtv.org; robh@kernel.org;
>devicetree@vger.kernel.org
>Subject: Re: [PATCH v7 7/9] media: chips-media: wave6: Add Wave6 thermal
>cooling device
>
>Thank you for your contribution! Sashiko AI review found 4 potential
>issue(s) to consider:
>- [Medium] Initial thermal state commands from the framework are silently
>discarded during registration due to a premature check on `thermal-
>>cooling`.
>- [Medium] The cooling device acts as a silent placebo if PM domain
>performance states are unsupported.
>- [Medium] The driver incorrectly uses
>`dev_pm_genpd_set_performance_state()` with a raw frequency in kHz,
>violating the OPP/genpd abstraction and risking hardware malfunction on
>platforms with abstract performance levels.
>- [Low] Defensive out-of-bounds check returns success (0) instead of an
>error, masking invalid requests and caching wrong states.
>--
>
>commit 99914a36008f0afa814ae979e8bbaf4616a8b747
>Author: Nas Chung <nas.chung@chipsnmedia.com>
>
>media: chips-media: wave6: Add Wave6 thermal cooling device
>
>Add a thermal cooling device for the Wave6 VPU.
>The device operates within the Linux thermal framework,
>adjusting the VPU performance state based on thermal conditions.
>
>> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.=
c
>b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
>> new file mode 100644
>> index 0000000000000..1e67943b213bd
>> --- /dev/null
>> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
>> @@ -0,0 +1,143 @@
>
>[ ... ]
>
>> +static int wave6_vpu_thermal_cooling_update(struct vpu_thermal_cooling
>*thermal,
>> +					    int state)
>> +{
>> +	unsigned long new_clock_rate;
>> +	int ret;
>> +
>> +	if (state > thermal->thermal_max || !thermal->cooling)
>> +		return 0;
>
>[Severity: Low]
>Does returning 0 for an invalid state request (state > thermal->thermal_ma=
x)
>mask the error from the thermal core? It seems this would incorrectly allo=
w
>the caller wave6_vpu_cooling_set_cur_state() to cache this invalid state i=
n
>thermal->thermal_event.

The thermal core already rejects state > cdev->max_state, so this is dead
code. Will remove in v8.

>
>[Severity: Medium]
>Will the !thermal->cooling check incorrectly trigger during the initial
>synchronous state assignment?
>
>When devm_thermal_of_child_cooling_device_register() is called in
>wave6_vpu_cooling_init(), it synchronously calls
>wave6_cooling_ops.set_cur_state(). The registration function has not yet
>returned to assign the pointer to thermal->cooling, so this check evaluate=
s
>to true. This would silently discard the initial cooling state set by the
>thermal governor.

That can happen. Will drop the condition in v8.

>
>> +
>> +	new_clock_rate =3D DIV_ROUND_UP(thermal->freq_table[state],
>HZ_PER_KHZ);
>> +	dev_dbg(thermal->dev, "receive cooling state: %d, new clock
>rate %ld\n",
>> +		state, new_clock_rate);
>> +
>> +	ret =3D dev_pm_genpd_set_performance_state(thermal->dev,
>new_clock_rate);
>
>[Severity: Medium]
>Is it correct to use dev_pm_genpd_set_performance_state() with a raw
>frequency in kHz?
>
>The dev_pm_genpd_set_performance_state() function expects a performance
>state index (OPP level). Calculating
>DIV_ROUND_UP(thermal->freq_table[state], HZ_PER_KHZ) instead of retrieving
>the actual OPP level via dev_pm_opp_get_level() could violate the OPP/genp=
d
>abstraction. On platforms where the performance domain uses abstract level=
s,
>dividing the frequency by 1000 could result in an invalid or zero
>performance
>state, breaking the cooling mitigation.

Will use the OPP level instead of computing the frequency in the driver,
via dev_pm_opp_get_level().

>
>> +	if (ret && !((ret =3D=3D -ENODEV) || (ret =3D=3D -EOPNOTSUPP))) {
>
>[Severity: Medium]
>Does ignoring -ENODEV and -EOPNOTSUPP errors create a situation where the
>cooling device acts as a silent placebo?
>
>If the platform is missing genpd performance state support for the VPU,
>these errors are caught and 0 (success) is returned. The thermal governor
>will believe the device was throttled and will keep trying, but
>temperatures
>will not drop since the device is not actually being cooled.

Agreed. Will report the failure properly in v8.

>
>> +		dev_err(thermal->dev, "failed to set perf to %lu, ret =3D %d\n",
>> +			new_clock_rate, ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>
>[ ... ]
>
>> +int wave6_vpu_cooling_init(struct device *dev, struct
>vpu_thermal_cooling *thermal)
>> +{
>
>[ ... ]
>
>> +	thermal->thermal_event =3D 0;
>> +	thermal->cooling =3D devm_thermal_of_child_cooling_device_register(dev=
,
>> +									 dev->of_node,
>> +
>dev_name(thermal->dev),
>> +									 thermal,
>> +
>&wave6_cooling_ops);
>
>[Severity: Medium]
>As noted above in wave6_vpu_thermal_cooling_update(), since this is where
>registration happens, thermal->cooling is only assigned after the framewor=
k
>might have already attempted to set an initial cooling state. This causes
>that initial command to be silently discarded.

Same here. Will drop the condition in v8.

Thanks.
Nas.

>
>--
>Sashiko AI review *
>https://sashiko.dev/#/patchset/cover.1788496816.git.nas.chung@chipsnmedia.=
c
>om?part=3D7
