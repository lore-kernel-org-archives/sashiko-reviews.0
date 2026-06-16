Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885643CE099
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 05:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=173.37.142.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781586892; cv=fail; b=N52Khv+urJ0Opz6oTQbw33dno8QeTePoOAEyDWWMsEfteUunpWw3pDyortnRMSjeT25hEO3trnglFgGVStkQuNj7NGBe94NACCrld/ZmWqxUzsMt10SKI3JUzGt2ZDQf5RCYuoXbjMMidMhNzUcI09nrV2L47EehXKpujgI4dNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781586892; c=relaxed/simple;
	bh=eazCtP3uSb8guYXw+vZbV1W0bY9932WPoPTAz79+zog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zp89KU/KF+XmAfk0ydLz4CspKz4+MEQGNqQWn8ABVZpFr0Db2cPwTsaIZtCsYN9Xe9ejP0UwnRksJMMSYSkwWQ26aF6oL1AspUbyIYWUNe3zVVAf59W2YB2EAkLB7qvVPuSx7JqT42N3Qv0EyL2Sli+N2aMH1d8nWjScHycFp74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=lrLCgJ97; arc=fail smtp.client-ip=173.37.142.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="lrLCgJ97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1478; q=dns/txt;
  s=iport01; t=1781586890; x=1782796490;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eazCtP3uSb8guYXw+vZbV1W0bY9932WPoPTAz79+zog=;
  b=lrLCgJ97QgBfB6lRHArT9JE97uawiRBECRviAoPQIJOmi7tLe2zOIW9F
   Px4w+twVQRjx6ZOziZ9FPmYIiRs8n80uQAGZ16AH73pR34ooxOTj8rsky
   9Mf+0f5iRUktlyOhKAwG9VkIcauqyYQ4rmuWxcFhdI1/hsdU4yy+w+ivd
   OOL50i4u9dWO+w16FKeDKUj2ZBrgn8QgFOWDvZMWW4YditkVVTgMSN2f6
   NsV5C7gtqvo4wS5avJGe0Oqpctmadg1DOpLEjX9V4FLqD8Y9tftI6dkcF
   SVyBvhUnBklaMaJQ+On5vtKSSY6LdkmMsAR8r5GtUqHq+fpnx/jwmoTFC
   w==;
X-CSE-ConnectionGUID: eUAp7QcxSGWUnDWWnHSrPA==
X-CSE-MsgGUID: StfqH/BGR1CyCZfmbkDsrQ==
X-IPAS-Result: =?us-ascii?q?A0CRAwBo2jBq/40QJK1aHgEBCxIMZYEGEA8LgWpTgitJh?=
 =?us-ascii?q?FeDTAOFLIh8nhuBfg8BAQENAlEEAQGFBgIWjSkCJjQJDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4ThlAMhloBAQEBAxIRBA1FEAIBCBgCAiYCA?=
 =?us-ascii?q?gIvFRACBA4FCBqFVAMBAqV+AYE9Aooqen8zgQG6FxWBCi6IWwGBcIQGOIREJ?=
 =?us-ascii?q?xuCDYEVQoJpPoRFFYNEOoIwBIIigQyREwlJeBwDWSwBVRMXCwcFYUJDAyovL?=
 =?us-ascii?q?SNLBS0dgSMhHRcWHlgbBwUSICpCRSMDAhYzNAQhQjgLQwWBXQKCGk4jHwM5f?=
 =?us-ascii?q?4FvgSVnZhUwNYEBAREfCjoDC209NxQbAwQ6ewWMWxcPgjwugWMvgQ6WfEmaQ?=
 =?us-ascii?q?pUXCoQdohEXqmwumFojqHQCBAIEBQIQAQEGgWg8gVlwFYMiUxkP2EN5PQEBB?=
 =?us-ascii?q?wIHDgMLgWiRfQEB?=
IronPort-PHdr: A9a23:TSP3cR2KOv37Yv0OsmDPmlBlVkEcU/3cNwoR7N8gk71RN/3l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:GHVR56yndScKvc51TSN6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUOy
 DQeXDyPaPuMMGr3Ktx3atu/8kpQvp/VyIVqSVA4qlhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHwb+WJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4+aT/H3Ygf/hWYqaz9MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEwLFJVHw+1nOk5xy
 Po0Fw8LTiuZv8vjldpXSsE07igiBMDvOIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiZC/FMEg9/5JYWn+6ymnj7ej5wo1OOrq1x6G/WpOB0+OeyYYWLI4bSHq25mG6ju
 mzf3yPTLStDH820+zSA+HGAnfX2yHaTtIU6UefQGuRRqEaa3WwSCxpTT1aloPSmkWa6WslDM
 AoQ+ywzve4++VLDczXmdxS8pHjBulsXXMBdVrVmrgqM0aHTpQ2eAwDoUwJ8VTDvj+dvLRQC3
 V6SlNSvDjtq2IB5g1rErt94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:/4Ylh6PzBQEGOsBcT87255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UgssREb9expOMG7MBXhHO1OkPgs1NCZLUbbUQqTXc1fBOTZskfd8kHFh4pgPO
 JbAtdD4b7LfBZHZKTBkXSF+r8bqbHtntHL9ILjJjVWPH1Xgspbnn5E43OgYzZLrX59dOIE/f
 Snl616jgvlU046Ku68AX4IVfXCodrkqLLKCCRtOzcXrCO1oXeN8rDVLzi0ty1ybxp/hZsy+2
 nMlAL0op6kr+y6zRHk0WrS5YR9mdfqyNdPbfb8y/T9LA+Cti+YIKBaH5GStjE8p++irHwwls
 PXnhsmN8Nvr1vMY2Ccu3LWqkrd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vet7zL
 lA0wuixthq5FL77WHADurzJlZXf3mP0DwfeCko/iViuL4lGftsREokjRto+dk7bXnHAcscYZ
 lT5YnnlYVrmBWhHjDkl1gq5sCwVXIuGRrDaE0DtsuJlwVyphlCvhElLAh1pAZdyHr7IKM0ut
 jsI+BmkqpDQdQRar84DOAdQdGvAmiIWh7UNnmOSG6XX53vFki94qIf2o9FrN2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlO/grWSGuwUDzxwoUGjqIJ94HUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZTD+X4JWXjFI5V10n1WoVUK3MZTMoJ0+xLEW6ms4bOMMnnp+bbePHcKP7kFislQHr2Bj
 8ZUD36NKx7nzaWs7/D8W/ssl/WCzjCFMhLYdrnFsAouf0wCrE=
X-Talos-CUID: 9a23:QYhDxmGYg8Zsrz9/qmJqyWcMRfkuYkby80rWD3CHD0ZSUoW8HAo=
X-Talos-MUID: 9a23:zDllOgX3d07pZBvq/ATwiihCc+1H2f2FGWs/n5AMuOWfLxUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Jun 2026 05:14:41 +0000
Received: from alln-opgw-1.cisco.com (alln-opgw-1.cisco.com [173.37.147.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 749C5180072A1
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 05:13:51 +0000 (GMT)
X-CSE-ConnectionGUID: X22YVo9eR9u3Whn50b8nYQ==
X-CSE-MsgGUID: vqcBknAqT7aXN8Hds3xP5Q==
Authentication-Results: alln-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.24,207,1774310400"; 
   d="scan'208";a="78168716"
Received: from mail-northcentralusazon11012045.outbound.protection.outlook.com (HELO CH5PR02CU005.outbound.protection.outlook.com) ([40.107.200.45])
  by alln-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Jun 2026 05:13:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESvcEw+FlpOf1fkvW4MvN3hOvhz+w6fpWlqqiHinYE2jzMWlulmGmMmAaKn1qTDPIjRm6fRQdr2cOCLDmQ5eoU3qp7xCuDxcggWuEHx0QKkGRsYOlbjOITHNBcaK3ITl99ojWUYC+tn4YTlqJfnWsoyyBa9YD99ZOO0vAWZTW8DDWAtF9kThRu9s3b0Auqib7gTxo9i8xegIEusb3tGlNWQp5HCRQyUOLUaPnq44G+Mfkjpg1+rJhKIbqhKnu8Jb5Z3XGqbCl7slE678HJCzN+fsAhYDGCqaT8xmfDCQ+1qdgb/IeQpG8Ai/OwYjWSFUvcm6lsw9fPo9to+YpigcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eazCtP3uSb8guYXw+vZbV1W0bY9932WPoPTAz79+zog=;
 b=lXoqct9bejwdeMWGbJEJm4Il7RCMhn09JY4HVQdrYfgoiMbZ1CRGe6Ty1Kqpa3xSwi8mEHwpyTuG/vMxLQZnj5XcMnaqGOrw9aW49BlvaxOvryyjaCb777c3QJC1lLktQ7Exvw8oJ8fRLHWTND9BUrobVG8MzvfgHXUwSb7U+hqt1mpvGBbIxpu61LYWZ/uhEMLVuIVEyewkxSj0vO6a9XSyJ8QUITJYKrkHcC2J1NGN1fsy+/XhOiTxbssX84L4xCZBgDE6Use+zyjm2kLdXsG9femfZ1PS4vljA1pSOZs2+m5IOoQ+k2w/F8bDlx1dRXGIgJimXw80Lde3vGsUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 05:13:49 +0000
Received: from SJ0PR11MB5896.namprd11.prod.outlook.com
 ([fe80::41fa:d12d:31c1:d5db]) by SJ0PR11MB5896.namprd11.prod.outlook.com
 ([fe80::41fa:d12d:31c1:d5db%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 05:13:49 +0000
From: "Karan Tilak Kumar (kartilak)" <kartilak@cisco.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Sesidhar
 Baddela (sebaddel)" <sebaddel@cisco.com>, "Arulprabhu Ponnusamy (arulponn)"
	<arulponn@cisco.com>, "Gian Carlo Boffa (gcboffa)" <gcboffa@cisco.com>, "Arun
 Easi (aeasi)" <aeasi@cisco.com>
Subject: RE: [PATCH v4 02/13] scsi: fnic: Use fnic_num for non-SCSI
 identifiers
Thread-Topic: [PATCH v4 02/13] scsi: fnic: Use fnic_num for non-SCSI
 identifiers
Thread-Index: AQHc+pbEXUWIMrK8OkSiDqdkq+hlkrY7RWGAgAUHx5A=
Date: Tue, 16 Jun 2026 05:13:49 +0000
Message-ID:
 <SJ0PR11MB5896264CC178D592F9D5C234C3E52@SJ0PR11MB5896.namprd11.prod.outlook.com>
References: <20260612180918.8554-3-kartilak@cisco.com>
 <20260612185714.174651F000E9@smtp.kernel.org>
In-Reply-To: <20260612185714.174651F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5896:EE_|SJ0PR11MB5088:EE_
x-ms-office365-filtering-correlation-id: b482d778-4c59-4eae-1c3e-08decb660caf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|22082099003|18002099003|3023799007|4143699003|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info:
 LX4xLJrRUGe08LiT4b+JMN3mYBZxYEzJfIaiQ5XqVvEt+LyGwTPkQ+s3mBit9ajPQGUk5MVz+jxqXhNd7pn24chK4KEl0DvC/sxw29eVj5jQ025ZD5r3P/iEg/TJ72yH2C5jdMV7TYCAQzc0qJzVsJukzIDT3HcfV00l03WdWySKONrh6pJBwW4Id5r6f+LSZwlPTv9yko0cfeMSq/juHmm41iPKUFZ2vCgtmmXObc8307LzKBK5O3Ow8PANMJ8Pn9W0EvKbxed8L79QLMgeoqV4MDJqUKokWGuoXvAuHbq9bzuJg5gJ2ID1N6aAc57Ez6enSBT+mdV7u7FZ8fTN77/i3OqjOiH2ZcMRdlD6x90GOsTT7zbBp0VgJawhbS5hynoaVPQdkB8HihHjOw3xKdkNpW2KJ7t8AYBYxkPGlRqp+vlRyNvWXxqI3dzPwH+5RAoHRWqgfsQNPshnekl5V/iJfa1yMA6Rh6uDFD0dEw8KYVnUMwOAhvfMgfBa3jeqwZ4ujUT+X2fseognXDDF2ANdIUfLYsAyuXUfFt6hmtRX8ZkKs7YJ0EfSDHG2X0DhyrAfcojy0W7IwsXFqx20i2SvFwHGnVMD/0cN0YfRQrkf8s4r4OWAlaB+SRWo0WPimclQY8czw9MuV2oyEnfStSSg2qS20yGMYbOmkUR/1ry9r+2VB84f+aDUPN/CKEkAP5RpoYIeLZ/GLowq+C+ZFdkY++MYV0PUu1BB1Dxp8jaJdqOkD0aNaDTE0RmymlJ+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0Nid3VuT1NhTGYvT2xWSG5rTXZPMHB4RU1rQ3dDeWpRNUY4L2trbEVRd0FZ?=
 =?utf-8?B?Z2Z0THB5Rlp0Sk5reTRKM2kzbDBlYlIvWlJiNjIzbnJVTnZzUVRKNW1PakRW?=
 =?utf-8?B?eVdvYW0xdkppN2h0cWJMazJOUnhVQzNNOEtRMkgvWnpSak1tYXM4bVd5WTlW?=
 =?utf-8?B?RnRReHAySTJqSlA0aW1ra1NtMStRVVZDaHlISDJHTFQ4YnBhamUzRUE4S0NY?=
 =?utf-8?B?NTdCd1dqZnNBMXU2Y2N5c3A4UHFza1ZYV3FQMWp0WHIyK25LQ0xHTGsrOFo4?=
 =?utf-8?B?WjM2MDI0YjhOMFNUUkI1cytUaXJWWDVrTHp0TWsrRnZGUi9RaWJUL1JLdCt2?=
 =?utf-8?B?cmFhczRQczd1d3RWL3VFejhXTGZYWEJ3V2tFb0dtZFh3WUg0dmlyaGVTakZQ?=
 =?utf-8?B?YkRucGRYZzU2VzhhbVgra0RCWFNjbU84RXZDb3NpZElJa2x0dkFmd1NKbk5Y?=
 =?utf-8?B?SmV1eHQ4ekdIUER4UVJCV1J6cnNtYkhSUUZqRzcwUWZqeXVPOHd5SlNUV01C?=
 =?utf-8?B?cVJUZW9aTUpTSnJGTEFqbWc1M0lxejlWbnFsckU4SUs5cUVvZTlyL0R0ckVj?=
 =?utf-8?B?cEh4VVI1UFpKMjh1MkduY2h0TTE0V3VUeEdCMFN5NTdKbHF0UUpDYzlzUWFG?=
 =?utf-8?B?eFk4ejkyOVp5MXQ5RFYxakNuVWFWcjNtS09zR1hYZ3REUVVBeFpTMVF2OGVq?=
 =?utf-8?B?dG80UDZ2azBkcXh2cDMyQzdTd3JlTFNXbHFBcy9xTlJHelhKYzVoMXVrb1dk?=
 =?utf-8?B?WXcxbmdEQ0ZrdURrSjA5ZDNxUUU2VjlaR3F3emNlRitvSk9WUXhEcTU3cXlu?=
 =?utf-8?B?ZGFJUjNYT3c0SEt1SUdRZEZXakRWYUI2ZTFOVXVLUWl6ZXJQYnlyTE1oUWda?=
 =?utf-8?B?RDMvTnh3TnBVRkZqYnUrRzM2cG8waHdndEZnbHN6cXE3bEhuZWZ1cnZaSHlu?=
 =?utf-8?B?UUhMUkVFdWFyMW84c1JGWm80T0xmTGg2WlNkOU9yTjJNa01hM3lSYkdnYzFh?=
 =?utf-8?B?TC95VzBDWm0vMmN4Z2grcWQwN0xXS3RidVVPNVNxOSt3NlFmNW82YmdiUUQw?=
 =?utf-8?B?TWFib1V4eVVzTlRsKzBBb3NyMHNOWG5tbTZFOXlhbGxkWGVMUHQzeDNmWExU?=
 =?utf-8?B?MktZdjVqR1UxbzgyNWxVYkdXWjBka204azVnYTUwWTJjZk5UaG9TT252dU00?=
 =?utf-8?B?K2t0UlcrQ05uOFdPWjRPS2xsbjNzTG5rQ2RGWlp1MEJJNkVteDZxT3h6YTda?=
 =?utf-8?B?d2F2UDV3SW5HcysrSVlaQnoxb3ZmRW8rNm42ZGt0MHpRNEZFNVdocVRBQ1BR?=
 =?utf-8?B?dmZId1RXQ0hCbFlRSS9OTW1FdS9nVW01UUZmbnBrRERSK1dFSTB4K0FYUmkz?=
 =?utf-8?B?M0ZTS3AvZFdaRmpxSyswKzNUalQ1YWtEYmtPNDRjaCtNUE5aeWVCalBWWG9Y?=
 =?utf-8?B?Mzg0eENRQlo0Ty9vRUs0TC9KNHJRRkpzMzFyMmRSR3NJeElncURXblFuTmZ3?=
 =?utf-8?B?Q2xMSUNTMkRGUTVnS1RHbmM2akFsTkVEakpKZkE1UXVzSm4xdnR1amZuK1A0?=
 =?utf-8?B?bFZoeTZ0TjZoTFpla0VXcFN2OTAraWRtUXc0TzJ5eCtoREZzSGR0b1NmeFJ1?=
 =?utf-8?B?WGF1a0JGbHA5QWNRQmdjQno4Z3pGVHBTTkI5VWVsUGx6Y1ZCcnNCVnZCajU2?=
 =?utf-8?B?akxBeGZqTE1iOHBISkoxSDI5eFQ3ZTgyK3FtYkJVRXZNYk0rVTBHOUU4amtU?=
 =?utf-8?B?OEIrd1VQUCtZRTMvZzJjN3VCeXpWZFlBS0dGdmxxSFJteEhOcXpFeUxCZktG?=
 =?utf-8?B?OE05WGpHUjNndE9Oa2hpMjMvNXZQbjNPNmk4eGlkTVhpeFZOSENwbllDdGxr?=
 =?utf-8?B?cFJqRE5LTVpLUkp1cFFDZ2NJKzRRZkZOMnoxRjY0ZytncVdhTEJZZWxXaU9t?=
 =?utf-8?B?VytQQndJOGpNdDVBTDlSWGpGdkJ5M0U5M2ZmZzVmTjhsL3A4QnUyMWpaMndR?=
 =?utf-8?B?K3V5d0Izcnc1TzZlbUdjcGNVY0RkTGRuU1dIYUJkV05tRkdVVklrTWpVcGRB?=
 =?utf-8?B?S2lBdG81a3l0YXltWmFNTzZUblBtaHNzakZDQTIrSzFJcElEU2EvT3lNa2tT?=
 =?utf-8?B?REovR3BGaDI1OFdONWJCQjN5SzJLdWx3SWFoWFRXbmdVZE8yVFZRQTliNHg1?=
 =?utf-8?B?VkhxOHFNZm9yYVcwcDgvQ3hiMGI2eWFnU3V5YjJhclhEYzcvVTZXTFBaZEFI?=
 =?utf-8?B?bS9VU3JNRXVhNEh1ZkVEQ3NPa2pzUGdkdmtWY0ZBUmdRckRmS3lxRElibW9Y?=
 =?utf-8?Q?EGXLoknTXgWzZJRg8e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Tp8s02Hxqci46gLTCNX4Mx5vtXtQCkJk5ERNOyY4DPubauFgLVgIMImhdv1pvJeXH/y+PAf7rSJ1k3drkf1cAFvVVs8maDzMPrepU8V8GOP6JsKWHQBaqdZTvxOhX+MvGjioBUIfkOVtomoKykMkiFFJGKjHt0VSziCBhPoi92Asnl1lsP7lNKXN/G5J17tz2du8ER9J2HUlJCyLQ/HX4Foq1X6F34r0XIBptzw2UEefxEUX/xIzJN0h9cteoFTJ22IT4Hy6e95I9Els7EQ8z/HsZrT7oGe4bi8cQ4mSM/7tHzu7tBBeet52rPFcWhAtWSEgriaPDfuSI6J8jJYURw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b482d778-4c59-4eae-1c3e-08decb660caf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 05:13:49.2742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2alN9GRY/6C4MTQvEi65f7P1b/FYUOuH4wta9p4X093Xjah5/kDifUrxZwe68x35vMe3KSBHKgZOTJ15OJotQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-1.cisco.com [173.37.147.229];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.229, alln-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com

T24gRnJpZGF5LCBKdW5lIDEyLCAyMDI2IDExOjU3IEFNLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPiB3cm90ZToNCj4NCj4gW1NldmVyaXR5OiBMb3ddDQo+
IElzIGl0IGludGVudGlvbmFsIHRvIHVuY29uZGl0aW9uYWxseSB1c2UgZm5pYy0+Zm5pY19udW0g
aGVyZSBpbnN0ZWFkIG9mDQo+IGNvbmRpdGlvbmFsbHkgc3dpdGNoaW5nIGJhc2VkIG9uIHRoZSBp
bml0aWF0b3IgdHlwZT8NCj4NCj4gT3RoZXIgRkNQLXNwZWNpZmljIHRyYWNlIGV2ZW50cyBjb250
aW51ZSB0byBsb2cgdGhlIGhvc3Rfbm8uIEJlY2F1c2UgaG9zdF9ubw0KPiBhbmQgZm5pY19udW0g
Y2FuIGRpZmZlciBkZXBlbmRpbmcgb24gZHJpdmVyIGxvYWQgb3JkZXIsIGxvZ2dpbmcgRkNQIEFD
S3MgdW5kZXINCj4gYSBkaWZmZXJlbnQgaWRlbnRpZmllciBtaWdodCBzcGxpdCB0aGUgdHJhY2Ug
c3RyZWFtIGFuZCBicmVhayB0b29scyB0aGF0DQo+IGZpbHRlciB0cmFjZXMgYnkgaG9zdCBudW1i
ZXIuDQo+DQo+IFdvdWxkIGl0IGJlIGJldHRlciB0byBjb25kaXRpb25hbGx5IHVzZSBob3N0X25v
IGZvciBGQ1AgaW5pdGlhdG9ycyBhbmQNCj4gZm5pY19udW0gZm9yIE5WTWUgaW5pdGlhdG9ycywg
c2ltaWxhciB0byBob3cgdGhlIEZETUkgYW5kIGRlYnVnZnMgZW50cmllcw0KPiB3ZXJlIHVwZGF0
ZWQ/DQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KWWVzLCB0aGlzIGlzIGludGVudGlvbmFs
Lg0KDQpUaGUgZ29hbCBvZiB0aGlzIGNoYW5nZSBpcyB0byB1c2UgZm5pY19udW0gYXMgdGhlIGRy
aXZlci13aWRlIGlkZW50aWZpZXIgZm9yDQphbGwgdHJhY2UgZXZlbnRzIHNvIHRoYXQgdHJhY2lu
ZyByZW1haW5zIGNvbnNpc3RlbnQgYWNyb3NzIGJvdGggRkNQIGFuZCBOVk1lDQppbml0aWF0b3Ig
cm9sZXMuIFVzaW5nIGhvc3Rfbm8gY29uZGl0aW9uYWxseSBmb3IgRkNQIGluaXRpYXRvcnMgd291
bGQgcmVpbnRyb2R1Y2UNCnJvbGUtc3BlY2lmaWMgaWRlbnRpZmllcnMgYW5kIGNyZWF0ZSBpbmNv
bnNpc3RlbmN5IGluIHRoZSB0cmFjZSBvdXRwdXQuDQoNClJlZ2FyZHMsDQpLYXJhbg0KDQo=
