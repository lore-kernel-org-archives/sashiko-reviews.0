Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3F2DECA8
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239628; cv=fail; b=Jz8hwMhEGzdBj2gvdal7h4tcqPCW2qNK1umd02BpKdhCzIcvD0eu1qM/CnIgJb3Y+ErwuxFq8vZrBMXm17XnpDiXejQQmwpkeZVwcxNQJJwHC7Bpl0rKNtvkHHuPqo7pOrj6klLXUf/Xt/zeayZxFhopSWEg3na75y0VsAvUyAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239628; c=relaxed/simple;
	bh=B++rGyEssVJmE2vOR8hUL+ok5103X0ALA/8PVj9BzVs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X6CeBg3ZZQboI4hSlk3szcjnnQxbRs8M78uUYoV30OACKd+klp8TB9T2VdN5q9V5ubwSOGfpT3w9Mmbw4d43CE4lntRBZEjI8cdS0Qw6Pye83SoiqpSxOa4JyDJZZLuJC4QfFsKTAWXzyhVCmJfjFvrJUpe8fEM5xGq6vFLYcmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jf//MBLr; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jf//MBLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788239626; x=1819775626;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B++rGyEssVJmE2vOR8hUL+ok5103X0ALA/8PVj9BzVs=;
  b=Jf//MBLrVn7zF14fwHxTtQbvDWVUiL63bj9cNuzwQJwq9YBnvNCegzst
   Qu5a8Enwv2clEsKtGFXwxtrabrUJPKZsnzKhkgl3AgU8g/bUzQ0eTGDDa
   +gEvIOf4jQJCxRsLY00eGXqCB5BQiEbqnuaH5rITNtwNqOfUPkP9q+mfo
   K6Y3e4IgkO6aIAoLZoYwEBY8iD9B8E3EpoU6lSmYpNFroLCdhAJ/S1LxE
   h5fVTrUU3HHtTupDYm8FUcmkcIcfWyX8uo4RSegMxX/AAiOMlG02t0EeC
   fRn0W0vtLA262WPGrmy02chtYIF9FgcjWJeHER4RD70QXBtPVtTaAin7L
   Q==;
X-CSE-ConnectionGUID: nnSSWpRqRH2y0X+2ICijTg==
X-CSE-MsgGUID: VZIagZrGQ2WJcV3CmkrKFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92470276"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="92470276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:13:44 -0700
X-CSE-ConnectionGUID: CxHZMQa3Rdq75Btop/gRpw==
X-CSE-MsgGUID: 1Zhr2UQ0SSudEI8qHNdLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="266403309"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 22:13:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:13:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 22:13:43 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 22:13:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3NG8BvGLoBboQywTAarTtdrNtmYpr1KMc3vH1iuvhbkGRhcPgOL76Pn9KJyLiOmAMPCGqohBbkpfz6ATivW/PHSZW4dhuVI+kms2Kd3gXanJoNE7hMwDMdyZA+kDtiwS91DryGFc2Z+KdS+aLWWRaY4ouv7/QgwRntisMDEh+PfcuJxEJsQQXz/xIsyy0EaKSOH1qjSA5GrFbCM6u5Djuqn6cfD5T/Au4eJnJSDwTNxXWdHSx862yuLrTQmUgb7bkVNOChrVdbBR5fIu25YxjXZyquAXl5tsEm5VA/SMhVOSYbLS+LyWwGb09Zc49OCqPnktoV0qjXu1xYeq6Pyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B++rGyEssVJmE2vOR8hUL+ok5103X0ALA/8PVj9BzVs=;
 b=pKmX9g1QLXEJnziXo5XKNKbf0jYPx64n+XeZgxnY6wafEmlq6PnwkG9OKDfZVfRb7PuvWJ0rbj1mghvBKH3IIsD7/dZ51CHLz9/kWE46MaJNe+UbhV+uUp+d1SykWoyCJK6m51Ta5I2cAwBqI7d6npWfMkxmzbjx7uSKIGwVtSI7B1qQ9rzOZP+6kTidiQxPVVdPiPPtuG7cBMUdXW/10ar2ZIcf8Jl+c6atPzIE1r8QGkKRoAY2x7uN10kmtFjTea8azaY5D4SxvDM4LOqIFZGCf2bOY2S4BIFBVRwZpc126w5/AkxIrGdgl17xLUPJ3IT2amzL5q0zCuVUoi+3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 05:13:35 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 05:13:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V19 13/15] drm/xe: Expose bad VRAM pages via debugfs
Thread-Topic: [PATCH V19 13/15] drm/xe: Expose bad VRAM pages via debugfs
Thread-Index: AQHdORUOU6NYl8K3L0eV5SIoDQwUZba34SAAgAFNlQA=
Date: Tue, 1 Sep 2026 05:13:34 +0000
Message-ID: <DS0PR11MB8718F6541F204D4D3DB73BCF81A82@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-30-tejas.upadhyay@intel.com>
 <20260831091812.9D4EA1F000E9@smtp.kernel.org>
In-Reply-To: <20260831091812.9D4EA1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DM4PR11MB7376:EE_
x-ms-office365-filtering-correlation-id: b5c9a053-9948-4f49-a5c6-08df07e7c5ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|4143699003|10067099003|11063799006|6133799003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: tfwQBL8xpcfe1dJq9MzinKE0JIfFJk/O92m7IJK7CUbOBhRsBwUwgYxXngzZVQXjl96JZoxfWFhOlUTGroEKEYHxVBAA6GbvHhyZR1FsbajtLOKfF6tAiY9iBqclYbkCZ3Y1nw3oNjziaM7HbnAs7ibYrXE8N4tPf4JVvEHYezZDQM95gRI/uMQBK1nRJHtb0UZZgluYObvuknNsMLVq8M1QwBdGo0ER2l4dA+uXtAohQ7IC+E4SL4ZKlZPEHuWSZuyscXkfUWp2mnEROxhuUqhp1+q2xYLGTvEK5oFIHQADqUpCvj6CEhDFTPvwLM5AHLpXRb5maGXXITiE2sLnH8lzg/whNz3ZItZcFFmzmYfTdpfWeTEvs5uzpmw6CZ2v323t5h+h+u8ZwMb8GCKByKa3bH1Z2/aF6oVGbF/1XbeItk25rMTgwZGtEVKBmCo9TiEYHRzzwDy9Ytpg6CukPTbJ8PC4OF3zVhbqCxWJtMkqNfkrdpw3qxn8N134KY7wkrHE0UMu+5/sNkbU8ntw5zNOmbYEJaJbVQ5sojmTlWp+9wzpZ7MTHfAEPW227AZEkyZNnoUHih+xKqyH1yorbJqXtKYNMnLPeYARamnnifSFfQHr+XY2pyn7xnUZfU9CgkLp4lXX2KwMAQcw59BhaJ6DYiO4LjJG6jX1BjaPGn8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXAwaUVKQ3NlN1VmQkRsOUIyM2RYSGZWRjhvcmlheDAvZUhmS1hnSVZyRjNs?=
 =?utf-8?B?S2lOalRrWk90dXFpNWZVTjJ6Qlh3bVI5UWphYThCVnEwL3ZmdVprSWtzQkxa?=
 =?utf-8?B?cHgva1ZWRkVlZWdlVXNVOXBlVFFHdDByRUZOejVSL3BkTFJFYlRWWEJ3UU9T?=
 =?utf-8?B?ak1kOXMxZTFxQTZPbjQ3RzJ0R080aHN0TWVsdjVmOEE0bnAyM3FSNDA5dVBC?=
 =?utf-8?B?UitBRmlIaGp3LzA1eHd3VUl4VkxyK2t0dVM4UTdBRzJsVlBPMXg0ZWw3MGlz?=
 =?utf-8?B?Z2RxdVR2OE9qNms0dTRQcUIzTXFlVmVqeG5wRHZBVDc3VW5HUzlJRjh2Y3k0?=
 =?utf-8?B?b0hGcG1ZRWlaN1hURTlDT2U1VTRwdkk2ZWt4OEN4azFvVlVYTjZBdGlWTmdI?=
 =?utf-8?B?K25WenNZbml5dE4zM29wZUpwWllNdC9TMDhJeGwzcWs0Qmh0TDUvQStocVVQ?=
 =?utf-8?B?bllXZnpEWWh4RFJmRWlHZkluOTRtbUM1MkZOMWFScHJUUUlIQkRqSG1VRmho?=
 =?utf-8?B?d1YzNFZWRkpadEZWRU9QTVZLZkQwTWlEZjMxVjdYVUhnMWdEeVZmQ1dRTU9Y?=
 =?utf-8?B?bmZOSVlyZ2V5Tm5mLzdiOTZKWEpRWS9nSkFjNGFLYW1ZZEc2Y1B4TWJZTzZk?=
 =?utf-8?B?bXNlR3hiSytEbTNkNHR2ZkJUNWtNSnBzaGJhbmRITnUyNmdxbUJ2d3JKTW9z?=
 =?utf-8?B?QUN4ZGtPaGxhN2UwWmN6NEhRaTlKejVOTVUvcmtUUFF1MURTcThibnpMZUx0?=
 =?utf-8?B?eUFURmhhMUlkMUc0cklNNENEOFVhMmRkVWVnM0ZRd0dZQ0FFejNuUVF1UjNw?=
 =?utf-8?B?WDd3S0txN1ozRjBCWEpWcmFGTDl5MTZrdUlqTWtBSHpmeG1aNlZpdUJIdGFW?=
 =?utf-8?B?ell5d1hkdDhJcFhzaWRydW5EQmdQbHZXczJFc1diQnE2MGlxOWw5ZXJjS2k5?=
 =?utf-8?B?ZC9HenNmM01OQ1hOUUcwek1pcHBYbDUydEdkRXhzZ29xbzBhNTBFZkN0bEdw?=
 =?utf-8?B?TFMxQzBqWlI2S3AxWGN0Y0VHWlFhb3piSVFYeTEwV0taR2g4VGk2b0dyd3R3?=
 =?utf-8?B?eVZtdzNXblJLWFVRVUUwRXpvUFpKVGc2ejhyeG8wWWRTa1pyVFdXWk1JSnJj?=
 =?utf-8?B?ZzV5ZEE3UExJemo2YmhndldZV2pSdnBydmVKbUtsLzdGek44S3R2NDI1ZzVN?=
 =?utf-8?B?bStweG9TVTNubEpWSXQxblNoUFhnWUhJNGxqaDNGOGRHRWVKU0NMTUtxTTRS?=
 =?utf-8?B?MVZrRS9FR3lZbkxqL2hnSEU4Qmw1dUtBV3dWeVp2ZE13dUpOb3QvZG9lOTZl?=
 =?utf-8?B?YjZab3dqYkRkZU9zOE45QlhmeE1pbUQ2NjlTSFN4aWZZWkh2T09QUjJBUkhW?=
 =?utf-8?B?MTNzZTM3VjdkTGQxa05pcGRRam04Nk1lbWhPREVqZXFJL1JucG1lNmxvMXdi?=
 =?utf-8?B?SWlIcndBa21iZXp0MlE4TG9USXRoVlhsU2p3KzM3ZHo5aFllSEh1bTNOWDg2?=
 =?utf-8?B?MWw5SkorSHJJUXZIaVFLU21SUEFJdUVYcHQ0N0UxTEJINDAwMFRudFkyZ0lT?=
 =?utf-8?B?c3IrbmNPZDZJbGR2d1hOelZuY20relE5OWI2dHM5cnlsYWp0VVd4RUVVZE9V?=
 =?utf-8?B?cHk4b3NXaVVobTFPazczQktacVpzVUtnWnF6TStyTFBuSnM4djAwYTNpRDVF?=
 =?utf-8?B?WnVhQWNkT1hRLzU5YS82VGRoMGI0M3dacjlJM1NabHl2SmZMMk5tb1lRcHdP?=
 =?utf-8?B?WGJQQTR6dXkxdTJ5TkZNTWREVkQwVGMyekVNb3IrRWZ0Wk13YWNiMFl4SVJD?=
 =?utf-8?B?S09NSWVuRVBVNHN0WDg1WVl0WG1zVVFCam1oS0xqaG11UHdjbTBpTFVxOUxT?=
 =?utf-8?B?M0N6VlFLL2J4QmFYOFlCVU1WSkxXQlBTZWZXWUpiZFdXQ2NoUGNkTW5ORTlM?=
 =?utf-8?B?SllIek5qdEdLQzladjlNZkFWa2NIMms5UmFHNWw0ODBHZHJoN2oxMTBuY3dw?=
 =?utf-8?B?dmxoN3ZVc01raFpFeFM1R20zOWFTSHEva09MczZsa3JVbTFua1hQMnk3ZUs5?=
 =?utf-8?B?QVBKVkxFbW9CRVhFcDRpMy9iNlhHaC9Wa2tNZmFrbUVJY1VlRm4wenpwazNM?=
 =?utf-8?B?Q0M0QUo2T2lnN3Z5R1c5MTBINGxQSVd5eXpNUHZVSnVzSVVkbmYyTHFIWE1D?=
 =?utf-8?B?UUUyUWo2dFF6VkJZdlBUMzNDdGZRbEVnMzNhSDJkOFRMR0xHV1BlL1VZZi80?=
 =?utf-8?B?NTBiZ3FjVTl3N2hWeXEvWm5JVVFsU2hJWDBzVnJRSENrZ0dueko3dlRENjRT?=
 =?utf-8?B?R29HUDZlNUkxbGdOcDdIVVNLRzNseGVqVUU3UkZ4cE0ycXgrWVVXQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Sr3sYm4Ixa846jOk1fAtIl+tIYGaBSno5vaBguYRoHBUOh1LFoknpGKYmVgqrjncLLXknwAsfgsgFCkIK7P9/wFiy7MvaH2ed5ZdUTN32M9Dt62sk8eHlkOEaFX4SW13BjjoxtWnEq0qgfE+M8JVdE8ziBtnByWkYngQ/WCnjLiQKtHF9KLprvHjB6jWrxwv2+JdAHTKN0YOKtGP5lPgDuhcevaAeR3o2uDOpy5dcMMFdvSXowyFus4AqLV6TDx9YnThc8S7YS3nHvcC/7L/Ov6gEzckzlsipveeD2lQFY092uWPzvnuRzMvDqb3UoSuYUx0G47ipWGHbvfOws6Oqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c9a053-9948-4f49-a5c6-08df07e7c5ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 05:13:34.8927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQQp8brlZuCh1DuxMjTkpUxQeWpWB2Jlmi73mgJxZHJx7jpI8DV+0OzonbELUgz3EA+++oe63O9PE+DS7U60Uarjc1IwxnWTzEijhFIiN1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2VudDogMzEgQXVndXN0IDIwMjYg
MTQ6NDgNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0K
PiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjE5IDEzLzE1XSBkcm0veGU6IEV4cG9zZSBiYWQgVlJBTSBwYWdlcyB2aWEgZGVidWdmcw0K
PiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcg
Zm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykNCj4gdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0g
SW5jb3JyZWN0IFBGTiBjYWxjdWxhdGlvbiBhbmQgcGFnZSBzaXplIHJlcG9ydGluZyBvbiBhcmNo
aXRlY3R1cmVzDQo+IHdpdGggbm9uLTRLQiBDUFUgcGFnZXMuDQo+IC0tDQo+IA0KPiBjb21taXQg
NTgyMTE0YjVjOTVmYjYzMzc1ZTI1ODQ2YWMzODIwNGU0ZTgxZDUyNg0KPiBBdXRob3I6IFRlamFz
IFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+IA0KPiBkcm0veGU6IEV4cG9z
ZSBiYWQgVlJBTSBwYWdlcyB2aWEgZGVidWdmcw0KPiANCj4gVGhpcyBjb21taXQgYWRkcyBhIGRl
YnVnZnMgZmlsZSB2cmFtX2JhZF9wYWdlcyB0aGF0IGRpc3BsYXlzIG9mZmxpbmVkIGFuZA0KPiBx
dWV1ZWQgVlJBTSBwYWdlcyBhY3Jvc3MgYWxsIHRpbGVzLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdHRtX3ZyYW1fbWdyLmMNCj4gPiBpbmRleCAyODZjODY2ZjFkNTgxLi40NTZlYTc4
YTMxZTJhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9t
Z3IuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYw0KPiBb
IC4uLiBdDQo+ID4gQEAgLTg0NSwzICs4NDYsNjEgQEAgaW50IHhlX3R0bV92cmFtX2hhbmRsZV9h
ZGRyX2ZhdWx0KHN0cnVjdA0KPiA+IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyKQ0KPiA+ICtzdGF0
aWMgaW50IHZyYW1fYmFkX3BhZ2VzX3Nob3coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICp1bnVz
ZWQpIHsNCj4gWyAuLi4gXQ0KPiA+ICsJCWxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KHBvcywgJm1n
ci0+b2ZmbGluZWRfcGFnZXMsDQo+IG9mZmxpbmVkX2xpbmspIHsNCj4gPiArCQkJdTY0IHBmbjsN
Cj4gPiArDQo+ID4gKwkJCXBmbiA9IChwb3MtPmFkZHIgKyB2ci0+ZHBhX2Jhc2UpID4+IFBBR0Vf
U0hJRlQ7DQo+ID4gKwkJCXNlcV9wcmludGYobSwgIjB4JTAxNmxseCA6IDB4JTAxNmx4IDogUlxu
IiwgcGZuLA0KPiBQQUdFX1NJWkUpOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gKwkJbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9yY3UocG9zLCAmbWdyLT5xdWV1ZWRfcGFnZXMsDQo+IHF1ZXVlZF9saW5rKSB7
DQo+ID4gKwkJCXU2NCBwZm47DQo+ID4gKw0KPiA+ICsJCQlwZm4gPSAocG9zLT5hZGRyICsgdnIt
PmRwYV9iYXNlKSA+PiBQQUdFX1NISUZUOw0KPiA+ICsJCQlzZXFfcHJpbnRmKG0sICIweCUwMTZs
bHggOiAweCUwMTZseCA6ICVjXG4iLA0KPiA+ICsJCQkJICAgcGZuLCBQQUdFX1NJWkUsIHBvcy0+
c3RhdHVzID8gJ0YnIDogJ1AnKTsNCj4gPiArCQl9DQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0N
Cj4gV2lsbCB0aGlzIGNhbGN1bGF0ZSBhbmQgcmVwb3J0IGluY29ycmVjdCBwYWdlIGZyYW1lIG51
bWJlcnMgKFBGTikgYW5kIHBhZ2UNCj4gc2l6ZXMgb24gYXJjaGl0ZWN0dXJlcyB3aXRoIG5vbi00
S0IgQ1BVIHBhZ2VzPw0KPiANCj4gT24gc3lzdGVtcyB3aGVyZSBDUFUgcGFnZSBzaXplIGlzIGdy
ZWF0ZXIgdGhhbiA0S0IgKHN1Y2ggYXMgQVJNNjQgd2l0aA0KPiA2NEtCIHBhZ2VzKSwgdXNpbmcg
UEFHRV9TSElGVCBhbmQgUEFHRV9TSVpFIGluIHZyYW1fYmFkX3BhZ2VzX3Nob3coKQ0KPiB3aWxs
IHRydW5jYXRlIHRoZSA0S0ItYWxpZ25lZCBhZGRyZXNzIGJpdHMgYW5kIGRpc3BsYXkgdGhlIENQ
VSBwYWdlIHNpemUNCj4gaW5zdGVhZCBvZiB0aGUgaW50ZW5kZWQgR1BVIHBhZ2Ugc2l6ZSwgYnJl
YWtpbmcgZGlhZ25vc3RpYyBzdGF0aXN0aWNzLg0KDQpXZSBoYXZlIGFzc2VydHMgZXZlcnl3aGVy
ZSBmb3IgNEsgYWxpZ25lZCBwYWdlIGZvciB0aGlzIGZlYXR1cmUgd2hpY2ggZmlsbHMgdGhlIHF1
ZXVlZF9wYWdlcyBhbmQgb2ZmbGluZWRfcGFnZXMgcXVldWUuIE1vc3QgdW5saWtlbHkgdG8gaGl0
IHRoaXMuDQoNClRlamFzDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtw0KPiBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MzEwNjQ5NDIuMzE1NzIwLTE3LQ0KPiB0
ZWphcy51cGFkaHlheUBpbnRlbC5jb20/cGFydD0xMw0K
