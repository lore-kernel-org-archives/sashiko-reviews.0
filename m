Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E503D47BD
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903317; cv=fail; b=VXt425ys2ACgYrmpY9vAIIi+ZcXkybi8HqEvSQuUI4dHjSUWySAp+8TrLj6MI+kcfopWKCIoGWLBSDuALzr7d/71A0jG+AJZ/tSuKA1VoHtNcX9cnK9oWnB8E5a4pEyXa8sTPppF95OYlrSa9pN0mjtoPaMIJeuKrkOeNaBGGN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903317; c=relaxed/simple;
	bh=UI9PTqnuWtvLJvL6gatcs/S63HJ9+GRpMNMZBFUs1IQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e2QxJm/TEv3ozlh0cfCGa5U8G1s3YR6ggpygx4Z8LvHQ7LPGxvgLciHvU6zz+lscEashik3Sq7pXZQnjE4CDOvtdHEqFr4Sy8iBKBAbl8gKHXuXwUENiT7Hs1+MgIPTBOATQffrwTmsq5Qrg1VACfJ8jpPpe6FkElYvbh/uwP5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiKycCLe; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiKycCLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791903317; x=1823439317;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UI9PTqnuWtvLJvL6gatcs/S63HJ9+GRpMNMZBFUs1IQ=;
  b=WiKycCLe8VRTkUC6+nv1JzFHprBC4obxYNCfKbwVMUqlL5aby0/me98R
   4pqQHSoSyn47RwTpZi2h3IPhcwrj7M56N+FvNukg9IdAhkh9txBRwAvqn
   4OV6SPfSItnkJzyQtUwmJRyUTft3GVTI+EyMROMjyeyqrT3chY+hlCRxI
   S62UQyaLGrl6GDa7ajH/mnY1nvcLmuc9SUCi7R2cjF4/Kdeo4RFwAbb1h
   LIOd9PaqODjzCSbsrIbtZ7TvgiMfkwvOFh5SWUQxPi8cZ3yR0FhMPa6Rs
   5y9Q9mAIkoa7CqREHZam4OgMPf9siHNy5IyTv3vsyH3jymvG0FvwGFbAV
   A==;
X-CSE-ConnectionGUID: q/F2wlDcT7C/0pk2J9oO2Q==
X-CSE-MsgGUID: FeydC2OeQvi2T59to+l6GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="638225"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="638225"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 07:55:16 -0700
X-CSE-ConnectionGUID: qsvM4lixQSK+6vUx6Ss1bA==
X-CSE-MsgGUID: qir12uhuRQqFfivGlhQLIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1267633"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 07:55:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 07:55:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 07:55:15 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 07:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxsfdlQBPbQBtRq9bZB8UiYt4BqeogLJcXDon1bGNgvO6TVhKY8GvjbQHuBE19E3ID1SZoKo4r2Dd//5HhI4AywPtGn+EkuW6AqOaCxz/80EYjqzfpn/++EzjzJCfd8d89jtYxAlsvU5LOK3Jp17B8UlsZypRpHC2SJO7kccGk2tj1JuGCTgyZGzuo5j8F56DDBOPZVuqgOKjePpdbfFl+Fwue5x8KmTz+YtDdPPyzCI7dipwTeNRML7Riv3vOA4ne2ZC6D8rOtpJ/ZIR1kVPht2IOy+QbYwxVed6BatCWbJncfVDI3qsjyPpgKZsbBB6VLY2FbIJEjeZop2Txt5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VWtHfkomVT5mRj9I5iNO1jg5EA51xxBP3VeFjMrhLk=;
 b=hG8pRNylYO5im4dxYAs3FOpHSNf2a/zF7DmlBTkSSJBk/oHsNwXQamNG3z61nezQfxvXAPN2ui/81eaUpU5eTS+9ZKe5zdrEtKS6iOmhX6drOXxeCW89wYqD4S0+nCAZ+jryERZiKTsdlKsCux7rSZXJddHPzVL1Mb5xbzmmZO9t8pDfWp/BNOdoLH69gxF6icmzg0UhhEiK2sz3t4z//SEv0cTJ/qzcH/o0xMHGZE72vgOgN4u8OPJP3CU7R3tp28jIrvAkHHIZC6NHm4Wy0oNwSprBHJ/UTPOTUf4b0lx3F2xFXZYPMMqWZR28s4FnxA7pk2FGWDXmiiDHsv2gCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by DSSPR11MB9644.namprd11.prod.outlook.com
 (2603:10b6:8:374::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 14:55:02 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:55:02 +0000
Message-ID: <2afa1046-2520-4aee-9015-48aca9e27e83@intel.com>
Date: Tue, 13 Oct 2026 20:24:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/16] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
 <20261013020636.447620-5-karthik.poosa@intel.com>
 <sashiko-outbox-168870@kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <sashiko-outbox-168870@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::8) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|DSSPR11MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: ab464b5a-e8e4-4bdc-8a31-08df2939f563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|10067099003|22082099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: SJQCKmNSFbeBTZ+NQi1GDrUTL6GgkfGz2DUvouv2ztAIfdoqug9Q2AkcwRr0VHFK26wY0Fq3Q74Zzu1kWih+/5koSbAC4gpI+zm2pxF+XFA1cBdOiWw9MgT3l72hEeRhZJ+FhuNB4s/hHL2pjr0s+E8B6lvMRT3vjKQAWucZJ7/3HoLL1Frv9PAfVP+gIuzCgL4gMHTLz8sY6F114GXltus3KkrUkqqcN0UOoCbhAYZ9J1OnV3//hc7i8bQbbaSYOwOUe/cnELgF8MBJQ883uv2cf0H8rUyJDPJI/Ub8JhuZ0Hg8ZRbrzWdpqvPajMSi4wFNJm9m7JGXa6rO0u3mfoy5SkDQfYFR6wdhYgz+4opvIcIL4d+Irk3msVc8kkWPOfl48Ric2buGrCGHeaVDECmNKnPMY4bOClmRtbHCAImahIdr+3FoMdaYgmgwz/kWO868UcH8MFRUkADqTiY7RTvrTms0UEF/czgvlFSG6b+vMovjKRGW/NDYvhA3YWvkUoNc1lYd/Mu62hGatIoWiHGfiSK6CslNis1m0nFAXxGWl8j++LpnS6O6DgtngCtpX6CoNXHgmZLKIH0fBjHsIQviWwJOxXV+5ng+yu2Y7osEixKdSMdKwnGxYPF5O6O7KDoaH7oB1iTnxBM6t0CknpGFFvZFQC77oBzQ1wP1IYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB852307.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmRhaDFZWHBlR2twQklhWitxUmJCRG55NnI2blpyQkJlbElpYUQzVUdTVWww?=
 =?utf-8?B?M0tKWlNXNzJnL000RXIrVFMydkFQdDVkdU44S09CZlNkb2E4K3Jvb3k2bVlE?=
 =?utf-8?B?N0JMNGFZb1hic1NYbjlVODJJZUcvN003MVhpdkFNSitLa0pNcXNaMWVCWU9J?=
 =?utf-8?B?ZTZQaDBuWE5WaWxTektYZWpFU2RvaFV5MHE3bnZIZkNxV09VRkxqQlJ1SzFt?=
 =?utf-8?B?STlseHBHN0JIL29wSkorVlVoN1JYS2dkWGNjcm1yWkhHRGlrN3JVbVFMVGFY?=
 =?utf-8?B?ZzVkUlhvSHdza1d2ZE1teEFYS3JSa2VyQ0czTFRqSldTK3o5ZFFseHpYMzRr?=
 =?utf-8?B?UjlsV1kvN3cxM2tNbkQwckNFcUxZekFMaHhqeUYwd1RuemZDSitISkJ0Y1Mv?=
 =?utf-8?B?UUU4ak44UzV4dWJPT0d1S3l1Yy9WOUhYOUpDMGVKeTQvb0hjaHUwOHZhQW1T?=
 =?utf-8?B?S2xia3RPZ3pUUW4vRTFOY3RhckRmMFdUbGZZcFNXMGp5SFJpbGRSUzZ6cUh4?=
 =?utf-8?B?OVFoV1Zxb1RBWUg1eTV6c0t4eUVSK3cwQ2xQVVBGZ3dwd2FsVlRtVTV5RUpN?=
 =?utf-8?B?YjdtQzJJNFo2bDlrTDIwVkFnQkJsM1lEd2REM2FNRENRVXQ3eEtZNWJrZnJU?=
 =?utf-8?B?MlI3U1h2ZHM1TWN5UTZlZ0pqai9ZdWdaM3BnKzVVdlY0bDh2WitXQWN4UGdM?=
 =?utf-8?B?d1N3Y2xrejJndUczRkgxZEp1Y24rYlcrdktuM2VnM3h2WUZnK2FxakEyN0Nm?=
 =?utf-8?B?eHhyOEhRQjFrMXllMHhjNlQ5ZjdkYU1MR2xOZkV2cUpOTmgyeUNrMzNYcFVH?=
 =?utf-8?B?WFBpVjYyenUwSzhFbmdQT1djTHdyWFpqa01MQlFkcWtkZHczWnVMbDQvMklL?=
 =?utf-8?B?WW1jeFR4Ukt6OERGbndpVWxHdjZXUWVWeHFhYlQ5UHhPNTRuNVluOFpYaDBj?=
 =?utf-8?B?V0JuR01GK1pwTG4zSGNTZUNzWUt1OWRTNXlydEo4WXNoVHRBRkJSUDFxREta?=
 =?utf-8?B?VElFYnpybEd3czhZYmlVNE1uWDY1Y3NJZEkwVVR3ZDB3ZVFoaFRXS2VtT3lm?=
 =?utf-8?B?UTF0dER1M2d6bC8zNjBRNXlKSDVjNUFkRVpMMjgrQ0wzL1RHdDBxMDZ3YzBp?=
 =?utf-8?B?Ty9ycnQ1cEVlRTFWeTR5bHlzK3Y5UVlMeDRBOGMvdzBRc1FpM002Umhyd3Zp?=
 =?utf-8?B?dVJSNDMwSnk4SG5OK2ttMkpMUnJFT3hHeDNrZVcrc2cyVUU5elhrUUZ1VWlV?=
 =?utf-8?B?NHlOWVFYWXFoZXpQRmVYcWZBazhtcnhYQkU1WWFTMzZtUC9qaXhBbXhFb2lP?=
 =?utf-8?B?N3U2UGtPQXhkUHVJSElHUW5yaEh5dGFkajBaR1locDRadjRtL1lsNFJWY09I?=
 =?utf-8?B?bitBb2k2NWFrYWRZc0o3VXgrWVVYSy83ZEl2RlUrclRnY2xUdTdNUHNPOTV5?=
 =?utf-8?B?OFhTVE1VVnYrUTFFS0pFaFhQZVpPZktnNE9IZDVwUGsyNlEyMGt5N3NSOUxB?=
 =?utf-8?B?U21MOEJOWnVWdkhsSGZ2Smo5Qk8rY3IxdkE5R3h3VGR2alZtUHh1R0srU2VZ?=
 =?utf-8?B?MEo3aHA3VDM3TXNSNUh4bFVpMkI1OXJCbmZtc3Z3Nm94SGZmenhUa3RBNGxB?=
 =?utf-8?B?SU5CR3cwVExSclJ6cmdGdGpPNWtFVWVmMFZVemk4aVBLd3dMVGpPeWlSRGpX?=
 =?utf-8?B?WHozKzNBU3U5TlA3T0VEWFpjbU5mUjBkaURGc0xaK3poUnArcEM1a0lXaE9P?=
 =?utf-8?B?SUxxV1pyUWJaM1RTZ0dEUko2T3l5UGpFU1FlVDdobUx3MlRCVmpjQ2x4OUVw?=
 =?utf-8?B?aDJKTlRjTjA3UVE1RXU4dSt6UXk3SG8rOFIxWWg1ZnFEZUNiT0gwTXpTYlhm?=
 =?utf-8?B?V1YzZmE5OGY2RG9pVWRIU0tuVGEzVWNqSHovaEpsYmQwclVqWlBDV2t4emls?=
 =?utf-8?B?ZkFCbXQwdnNObnVrRGZaSCtscTdQNFh6QUlpbXVhVDdNK1BXYnhHYVNjMXo0?=
 =?utf-8?B?MVNNTWdDbFhZWTJBZG9PYi91WnNlT3lXcnYxenVtWU9GSVlTSG9tR0pVZWpY?=
 =?utf-8?B?Y0RkRm1jUkMzbmJOUWhkVmdWemdlajF0V2pnMG9naVNXelJOK29Db3A3blVE?=
 =?utf-8?B?UXRwYXZDYTJQQ003dEI3WmtRLy95SGk0RWxSSXhnYkcyTTlmSVhkdFE0Qk1v?=
 =?utf-8?B?OHZxRzJxYno0T3NjUHZnODFwdHUvQVg5LzdsVkZrcHlRa3o5Uy95b1BBd01X?=
 =?utf-8?B?ZEpxM01la2V3TGxYcVVWazdjSC9qZlNKbFd4L05pQmo2cE1obEdGaEZLQWtv?=
 =?utf-8?B?TW5oVnV6Wk5KVjlTbjFNK1FGbG9jbk5vY2lYcUw4dzJQdGRWOVRJdz09?=
X-Exchange-RoutingPolicyChecked: YsSyH2TP2K04dj3WtRCZzSp+fasPTmyChJVRPqqtVsKRJnyU3KUa6rT6JZK8ic3WBf9DKd5LHOF6KALogXNUXW3oWuOJrGv9UiWX1TyjY7ooi3SRGGC/myQXJ7ZuBubREL9omYm/ymF76foQzzX7owcKfmXINazg3dRekNLfJspnEm0xzd8Up1RGWTIvIGk/NR7qFIiOS18mTRgf+rVfogdEerjoYaZSx79iQoby6cWjB0a9wLKu5Q0kIfcYfOn4YCRhUOaFeKcIZtVu4a74uVthXt1i7ecnZ4nkihl71HFKgH8i/Tchwp4JMcJy2CZr9/uEJ0IrCtP7wJdv0Z/siw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab464b5a-e8e4-4bdc-8a31-08df2939f563
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:55:02.0132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tUhQmYYBId00d//T5NaAFMea11dT8mOWuouF2+TckmXB3uphJDDMLF35U8PxpMa46j9IWD+eLoidj1/NzbTsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9644
X-OriginatorOrg: intel.com


On 13-10-2026 07:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] hwmon: MMIO read errors (U32_MAX) are treated as valid temperatures on legacy platforms
> --
>
> commit 30c789d23390d6abf7d18b4ec4f037b60404f1b9
> Author: Karthik Poosa <karthik.poosa@intel.com>
>
> drm/xe/hwmon: Add helpers to validate thermal sensor readings
>
> This commit introduces mmio_temp_valid() and mbx_temp_valid() to check
> whether a temperature sensor reading is valid. It gates these checks behind
> the has_temp_sentinel flag.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 2d1fa9159c58b..712a21a996362 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>
>> @@ -825,6 +828,23 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	return ret;
>>   }
>>   
>> +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
>> +{
>> +	/*
>> +	 * On platforms lacking temperature sentinel support, a value of 0 is treated
>> +	 * as invalid. While 0°C is theoretically possible, it is highly unlikely for
>> +	 * a discrete GPU in normal environments, making it a reasonable fallback
>> +	 * indicator for invalid or uninitialized temperature readings.
>> +	 */
>> +	return hwmon->xe->info.has_temp_sentinel ? value != U32_MAX : value != 0;
> [Severity: Medium]
> Does this inadvertently treat PCIe MMIO read errors as valid temperatures on
> legacy platforms?
>
> When a PCIe target abort or link failure occurs, xe_mmio_read32() returns
> U32_MAX (0xFFFFFFFF). If the platform lacks has_temp_sentinel support, the
> condition evaluates value != 0. Because 0xFFFFFFFF is not 0, this returns
> true.
>
> Later, in xe_hwmon_temp_read(), this U32_MAX value will be blindly decoded:
>
> *val = (s32)REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
>          (REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
>          MILLIDEGREE_PER_DEGREE;
>
> This could result in absurd temperature readings like -8,388,607 or 255
> instead of correctly propagating an error code when the hardware fails.
>
> Should U32_MAX be universally treated as invalid, regardless of the
> has_temp_sentinel flag?
An all-ones read means the PCIe link has failed, which is a device-level
condition handled outside hwmon. Once the device is unavailable,
xe_mmio_read32() returns 0, which is already treated as invalid.

mmio_temp_valid() is only used at probe, not in xe_hwmon_temp_read(). In the
next version I'll can add the check to the MMIO read path and return 
-ENXIO, to
match the mailbox sensors.
>> +}
>> +
>> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
>> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
