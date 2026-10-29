Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793267352;
	b=Nq4ftw1YySMcykTHl3ckEZUFXSUeVDRjEr7veLe+CasSg7ZkkfWDwbWGEDysVhiRx2ew
	 THm0w4j4y7XTdvN3qLflBQAqc8O8nOWuPOW/bDqH4VHJWYDxA5hOdjIqndmj0dOL3frld
	 1ouEX+NN74/5//tm3uj9J9Ah534neFkIbiyhyQb4Am84NDDpaCSxE7e5vTG0MzPx1K7ht
	 I6Z8R8cqJ/B1QQPLDq4VverQJxyw9wRMBq+Qblh88M0kLcy9q7JoZ1MBs7u5V2ivRDskE
	 KDOQjLf1QgtPTpYz6qeVIZTmz6t9swZnfqMFAtFHyOVnlc5t2zDow/M3UaQ7YzlSe0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267352;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=XQFGRrIQhwUwLTUJhWp3ZltLbLTYIWzjf54CpcXDdxA=;
	b=VqqBlUfzljn3mXsWJC5c3EGVYQPl2Csq7BYjYB22chu1Xspzt+Z8XEFwGVaSPrNJvids
	 5rQVgX8wMx8kbG+4xfjEZPyPDhcJhltZnjBQ5r4o57WKBfTbGTEqPFPGg0V645VSji3Ot
	 L7cekmVkzIBapqBuUdhpZCZrpRrPkwZwZBkGMXSz3u678HDBzFX+xNegjARIGd4NFtA8k
	 337Y/YK40o+KzHHd50NQEbP3vO2MtaY+zabhU2Yzaxmre2QgJPI264jUWer5XQd2YZ8a9
	 mhgkXE2+UESGlGv7JpFEECKQw4Je4VleoSyhaT3EJUgUhKtQXL933tfJi8dltz/JgPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KEMRhROD;
	arc=fail smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5986606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 09:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5986606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KEMRhROD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793267351; x=1824803351;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=o9V4Z4EBpIAunUzT63xSfRmlPuNUYtnUwMb5mlcMpIw=;
  b=KEMRhRODpMFA/IDrxieeLxw8entDO8rIk+YD7/pXAO2K1SZzPqrIOpx3
   chB1/mhdawZmSV1zzTjrK4Vgh8JadxLiy/wKcu6Yh5VCI3ZBnjQl3/DHS
   yEPWWwmeKIfsfpgbn19vIeeJWnBSCRRQePbxDbkoxJktG0ILKzaeLwRdX
   iD09uljekta9W9l4uQVrXt/m72uJaE2mdDuC65kdDwy1fuET8XRVJays7
   8GgbpDXjSbAJOT+1vArvWdzPiktIAcSNMr+1RRygc8YR80DOtpq77cOlU
   BwwAmOhWF8xB2/yNfSqdCUSLvUbgZWHaCsGIfH+Kh3b5wsd0ijGmZhpKW
   g==;
X-CSE-ConnectionGUID: Lr1wV1viTi62OlVQtwlf7g==
X-CSE-MsgGUID: ZcY/5IDyRd+3qfmDzm0yUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1900864"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1900864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:49:10 -0700
X-CSE-ConnectionGUID: BrT8UuK5Sje5l6t+ZvaptA==
X-CSE-MsgGUID: Pav9mkNnTtyI1jQfa3GGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5186802"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:49:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:49:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 02:49:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:49:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2GRRufGxTDRuctskoYnBV0ldxJMWmV1tWfodh2LUkJ3/qjwHSheNZ+HyS4hrNwwoX/T326ZF5xBYidI8gFUOrmZ/pYKqc/oB1W8pm3KvC2GIXRDYz9TBSUoKSi+svNKn5kuhPGbrvHtozMrHlG6t9a0T4igRUZ1KOR4PYknb45YNoz4HWUomBtXSzbbjNEzHTchCPmZz9UFn01Qnz0cxFdnNZLsxq6Onxo1t6nDUaL3DvatWkikMU+dWJhXAr25uEcLtOtm2uApVfXgUCnX4jvgoCh039BfyU3p1GCESwp55ApC0xESSc/m790qPFzcU0964jwMepyoNrtLDD0h7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQFGRrIQhwUwLTUJhWp3ZltLbLTYIWzjf54CpcXDdxA=;
 b=B6NCu7HZDyBKhRDpp2gRosXDu0UMxxA8ZNDUUZescn5pgusqfhyZU/WsKXQ7oAcPW/41KAYu42K2ufS6p4r/pFec22c5o07D6B61gKJMBMhsxuESOYLAGzn6ykswhgmYJJ4SqTexz7nQnDJFOmTPDCS0zJEDhMl9WQ7R+Z67ubdWdv+VijKFQPwiU+2ukvdWHsd9aAOhW6DtYMzaZAjjrKgnrHXiL7HKGhbMWWNWqGdHjXrC+QQAvc1SA/fu6vLpiYv6vx2GwoWQ0rQkaY9NdIU3gWb18Frt+OimIOk5WCo5FWM9poLLAYyJyws+wzBrtxj5GSrYPImByXSoqgK/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS4PR11MB456666.namprd11.prod.outlook.com (2603:10b6:8:508::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 09:49:00 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 09:48:59 +0000
Message-ID: <131144ed-82ae-4353-a55d-80db82dd3a6b@intel.com>
Date: Thu, 29 Oct 2026 15:18:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] drm/xe/xe_ras: Report correctable errors using
 SIGID
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261029082752.1739281-12-badal.nilawar@intel.com>
 <20261029082752.1739281-22-badal.nilawar@intel.com>
 <sashiko-outbox-188984@kernel.org>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <sashiko-outbox-188984@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS4PR11MB456666:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b93ec8-5361-4cfc-b90d-08df35a1db1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003|261026140227099003|261022105027099003|10067099003|261022113327099003|261021121427099003|261009223027099003|261026121527099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: Ru1wcQ1r0aKAbZmABqLk3WmSInq8pWZtLoT+Qpcp9zsy5Z3B5SmM00ZA/0ETYn/jCqhgz7fuza815lodixaAbvFeE07W/eWmxR3oEDIYVHRRVfCqVG5Ld0IjThT52Vs/EHTDMFM9PQth8jK2uvcxdC3wgux7+hnr0U2cFFtMPWo/QY3uD2lC/eLV0Uk+Jt4eyJb9Lsk4JXXws3HjaK51cfmivV6YO1GL7VSiLxasMTkyyJUu5LVU7oX4jMGrYvTDgrNFfh3Ko2yAC66JQ2c7MVDYrlk5zrQtXuNbPX5ML+SiDrhvUImq6Ic07oexa6ejYE4Otrdqz/3nLy+7u5N4nVsh2THyYHJaU7nIdRENa0AgO0AlTKklPql9wJatiCgZMSEgHg2fM81nJ+mZD8z6gRMQyAbsL6rSFV3tHopFHVgjpEdHNrxWuldKjeU5/RmEw/VGBmt3tOuWZAnPg78OllgmhHP8xyYbHo0oOtDkNiHipiqb5WB4USeP++8wg+sEUusacZhX1g9xOEs5tn1FjBkJHhVDHkg8L40NkI6o5xV7dr7JjnQM+57joDgqzvGPRmOCztkg6XymBjRYUiEGQ0VGXHsS1FdHA4CWyh341nnjjc+9b5O+9YloCK24c7WCzPSpvFj9AO54mO8ibZnDJ2vSkQjcR+Q9MDwTgCurIzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV0PR11MB9792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003)(261026140227099003)(261022105027099003)(10067099003)(261022113327099003)(261021121427099003)(261009223027099003)(261026121527099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGg0TDNIcFlZUVUxa3VoVGxFSnQ0UUZHaTZFcEE1QThtTWhUbXJaL1FMQWJZ?=
 =?utf-8?B?ZWRSbzhwelVsSWNWYWUvdGM4REtxdWJXcUdXRDVwYlFUZG9HelpOdUE3elRh?=
 =?utf-8?B?bUlFd1RSTUtZcWgyOEtwNU1VRDVEaGdYTHNqRzlUUlpvMDVTSGJQc1VIYzBn?=
 =?utf-8?B?SWdGSnJIZmdobGdTVFF1VUVkR3ZzRDFLMlprcDNYZmFwTHR4M0hmWStLMVZa?=
 =?utf-8?B?Y3JsbHZQY1VRL2NNbG1hci9IeWVhbVlLWHE5Q2V1bUJid2xkK05BMGRHb3Fy?=
 =?utf-8?B?UGZYTC9DVFNlQjN4Sm9MUmlPaUYvamY4eXliQjNvOUthWGl6SFdqVExINUtI?=
 =?utf-8?B?OFRvaVEvT3JzODBUNGhxQjVnMmc1ckZZc29Ed0JYSmtUL01Gdm0rZjFkaXlV?=
 =?utf-8?B?VWtaZVpTU2Z2Z3lXNmVWckxUNCtBaE9jdVo3NFRUUnQxT3prcmoycUo3dnBq?=
 =?utf-8?B?ZTF3b1VpTzhPWWRuOEt3SCt5b2d3R3hOWXR0Y0tEbGFRU1lBVS9ab3NGaWpT?=
 =?utf-8?B?QzgxcWRCT2R1bTlEYmlJUU1rMGtISXdwRXUwUDRFdVVqTEc4NFJ4WkYyUEQz?=
 =?utf-8?B?UkU1N0RmNE96ZEh0dFVjbk1oQ3ozaTFWd0ZvOVBvajlUWXB2dHJEd2g2Y0lj?=
 =?utf-8?B?ckliNkFNMFNjWFpVUlZRVjBRSDFVSDZscEJmQ2xreGp1bEpPUjdxaHp4VlJD?=
 =?utf-8?B?WFU4aCs2WlZZR3hBRFhJcy82c1Y1TW1iY0ZWNUNHN3lETkZjRVpXMXR6VldF?=
 =?utf-8?B?NWovMlVnMC9tclFxVmdBcEJUb2JUY2dyZUxSc2c4UWxCdFZ4eGxUdkd4VEFH?=
 =?utf-8?B?QUFpVDlBMGduOER3Zzl3UUFmU2d1M1lUTmxJc0d2T283dWhEdXBCVE15dTY1?=
 =?utf-8?B?ODgzRzhZbXBqeXZWODlZYkwvT3BlZ2VHdG9rRUtSNjlBbC9Qem4wNWVXa1hR?=
 =?utf-8?B?V3N5THdxc0puZmk1dlZveS96RTA3cEJkeGtnMXJDK3JTSUw0SzJCdDNFZ2Z1?=
 =?utf-8?B?RExXL0dLbzFkbllIZk5pSTlxU3BiWjZkSGhiYTBjRUhFZHZLTXNJUVVKc0VO?=
 =?utf-8?B?UXQ4NWxTejdiSGpaWFYyV2tBM1BtSGRkSUJPaTFDL2Exck1VRVNmRkZXUXF3?=
 =?utf-8?B?UytScGNkcmtsL3orQWVaTEJQOG4xa2F6c2t2REtkRGl5VnpTVWJtR21BUkd3?=
 =?utf-8?B?cWRFWUsvZmVzY2pZeFhBNTdJdWNYbmV4QjBzOFhZeTloZXovK3VhWGFjMk02?=
 =?utf-8?B?alVZak5WdDRvaXVvNVNqNzE2cks3NHJ4b2R5bHMzOGtaRnlEWHBVUTJDbFI0?=
 =?utf-8?B?d3YzWkQzN1hIRnF1WmlERDVQckdWQnNTQ3RFTHE1ZHNlUUlrV000Uk9SalpO?=
 =?utf-8?B?dGlmQXFtcm44eDh6Ukk5bmY5Wm4wTis4RFkwY0F0Nk9RVmpMSGFSclFGeG03?=
 =?utf-8?B?cER1NlFVejc5aHpMcllNZFBHSVZLMXE5VVBRUkovQkIydzVOSkhJSThSM1hX?=
 =?utf-8?B?R0xBQzlmQ3hLQzFFK3dTR21WaTBkQlRDRlcxbDd3OHphZHRCbzhsUFNYSlI2?=
 =?utf-8?B?NmxIcitJVFhxL0VWL2xnUlVyZE1laW1maVlrNHUzWW5mTzY5SDZWVUQ0MGV6?=
 =?utf-8?B?MjhxUzFWZW9jRXhlS3grOVR6b0VBcmZ4Rm01MU9pUm1pNjc5aFJWRHFZQmdx?=
 =?utf-8?B?V3dJeitwYlVpdFFyeiswanNCL3VPb3ZoMWRod2lRQ2pRNkVaa05BSUhIWGZW?=
 =?utf-8?B?dGtVQWtFdDkrWVhVQVJPR0t2L0ZnM2RWMHNIcHpidXQ4cXdpR0Q5VGZPdyt4?=
 =?utf-8?B?ekhYNXlUZEtSbzdrMzFob3ViSHVSNWNUdWRaMnNWalNyTVVNUU1SRDlVRm1H?=
 =?utf-8?B?VDBTOW5Hb1RvempjR1BFbkp1eEpzdUdYTXhTT3Q5bnp3b3FpYXk3TWRMWENT?=
 =?utf-8?B?N2EwRkpGdTU5VGRNOGc1cFVlU3NwcXBMeGZNYUF5Q1lEd0xGcy9CRWpiYnV6?=
 =?utf-8?B?dktPR1dhWXA2VGpzandUM09ubGFLam05SjBEODFXb24rbFBGc2JXVzNUKzEy?=
 =?utf-8?B?NmFnNWdQZ2xGcnFWVzRvd0FzN0drRkR4NXJSbU8vQXplZHN1V0ZqWE40a0Ir?=
 =?utf-8?B?Z1Iwb2gzRS9qOUFxNklUVTMvbHdydkZCZklXZzJ4WndpRU5XWHFUMGxmRGp5?=
 =?utf-8?B?aHFuWlI3L00vWml6MTE2ZUhHSkNFQXBPWEE2QlpPOUxia2oyYnhtekNaQkFZ?=
 =?utf-8?B?Ym9IeFh5dlYxQ2RYOXEzNGV1R2RkUUZXMEdjTU8rMVlSM3Bja1ZDZHFxN0ls?=
 =?utf-8?B?UVVZTytkNHNTUkxrbDVYSjg3L2tiVjVMblN1OE1vQkJZajNpNWN6UT09?=
X-Exchange-RoutingPolicyChecked: wRRVsEYGsPTsPd3WOJLbIX1Zpuimu0D2k5YM00p39Otf2pTsfQQENjPqMHcDL2S8SGe0AyTTh79JwxPKnPYkqaQtq7E3piHxQWrSzjED6mmEVBka7SZkNgivcHwO1gUTE9uzFY4NCOoZwGOZEQk0TrkmxynAkdg4pL/weIj6Kwg1fa+8kgzvqWlKSqTZPcS232S6WKFd5zJHc8E3A7eaWRGd1srxywg4a2MazfAT5NDnFZ8+GT2o6z7lhjcJOSvvQeYAWANINLK6LU9GMdXxTDQ6Er2qM6MEPtXi0t90AgWUANNfHinQZc/Vxy0L47/hIctJeC21WGndfI/sv6LTfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b93ec8-5361-4cfc-b90d-08df35a1db1b
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 09:48:59.2821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzmLNJq1KPBpxXQPfPfa7jdyMUJihWdK1mIX8bi8z7B7aBFih9FmWhtONkvYBgsPUtmInUQHi0TFOR/FqlJzww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB456666
X-OriginatorOrg: intel.com


On 29-10-2026 14:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe/ras: unrecognized log component for XE_RAS_COMP_RESERVED in ras_comp_to_log_comp()
> --
>
> commit 523a0553a8f4f634b0b558643739a2f201d23a02
> Author: Badal Nilawar <badal.nilawar@intel.com>
>
> drm/xe/xe_ras: Report correctable errors using SIGID
>
> This commit replaces xe_warn() in xe_ras_counter_threshold_crossed() with
> xe_log_from() to report RAS counter threshold crossings using hardware
> SIGIDs and log components.
>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 58d3834345bc1..09b3c96042d5b 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
> [ ... ]
>> @@ -226,6 +228,12 @@ static int ras_status_to_errno(u32 status)
>>   	}
>>   }
>>   
>> +static u16 ras_comp_to_log_comp(u8 component)
>> +{
>> +	return FIELD_PREP(XE_LOG_COMPONENT_CLASS_MASK, XE_LOG_COMPONENT_CLASS_HARDWARE) |
>> +	       FIELD_PREP(XE_LOG_COMPONENT_TYPE_MASK, component);
>> +}
>> +
>>   static inline const char *sev_to_str(u8 severity)
>>   {
>>   	if (severity >= XE_RAS_SEV_MAX)
>> @@ -714,8 +722,11 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   		if (!ras_counter_is_valid(xe, &errors[id]))
>>   			continue;
>>   
>> -		xe_warn(xe, "[RAS]: %s %s detected\n",
>> -			comp_to_str(component), sev_to_str(severity));
>> +		xe_log_from(xe, ras_sev_to_cper_sev(severity),
>> +			    ras_comp_to_hw_sigid(component),
>> +			    ras_comp_to_log_comp(component),
>> +			    &errors[id], sizeof(errors[id]),
>> +			    "error detected\n");
> [Severity: Medium]
> What happens if the system controller reports a counter with component set
> to XE_RAS_COMP_RESERVED (3)?
>
> In drivers/gpu/drm/xe/xe_ras.c, ras_counter_is_valid() only checks the outer
> bounds of component:
>
> 	if (!in_range(component, XE_RAS_COMP_NOT_SUPPORTED + 1, XE_RAS_COMP_MAX - 1)) {
> 		xe_err(xe, "sysctrl: unexpected component %u\n", component);
> 		return false;
> 	}
>
> This allows XE_RAS_COMP_RESERVED (3) to pass validation. While
> ras_comp_to_hw_sigid() uses a switch statement that falls back to
> XE_SIGID_HW for unhandled values, ras_comp_to_log_comp() unconditionally
> encodes component into XE_LOG_COMPONENT_TYPE_MASK under
> XE_LOG_COMPONENT_CLASS_HARDWARE.
>
> Because hardware component 3 is reserved and omitted from
> DEFINE_XE_LOG_HARDWARE_COMPONENTS in drivers/gpu/drm/xe/abi/xe_log_abi.h:
>
> #define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
> 	define(HARDWARE, 1, DEVICE_MEMORY, DEVICE_MEMORY, "Device Memory")	\
> 	define(HARDWARE, 2, CORE_COMPUTE, CORE_COMPUTE, "Core Compute")		\
> 	/*     HARDWARE, 3, RESERVED */						\
> 	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
> 	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
> 	define(HARDWARE, 6, SOC_INTERNAL, SOC_INTERNAL, "SoC Internal")		\
>
> passing that encoded value to xe_log_from() will miss all cases in
> log_component_prefix() and hit log_unknown_component_prefix() in
> drivers/gpu/drm/xe/xe_log.c:
>
> 	WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unrecognized component %u.%u\n", class, type);
>
> Should ras_counter_is_valid() reject XE_RAS_COMP_RESERVED, or should
> ras_comp_to_log_comp() handle unmapped components like
> ras_comp_to_hw_sigid() does?

XE_RAS_COMP_RESERVED is a reserved value and is not reported by the 
firmware. Therefore, rejecting it explicitly in ras_counter_is_valid() 
is not required.

Thanks,
Badal

>
