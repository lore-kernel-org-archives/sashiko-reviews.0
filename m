Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793616710;
	b=bjxG831a5rfou1A9DVjOV6nPy1Dy5Eg3R68gJHN2gvOTgdfZIBj6NFwidu5uu9cQ2l17
	 t5LZFenlflEN3rJZTrbCbE6qDCFcvwjmHIZRbJbkfBCDe9DYoF0SbYZA8bkl9Raboy3Qx
	 Xhuy7A0EjvaBRQsHfa9CG4iR6U71D3tWb9Ww8/JXW7dQQJ64m2MgtJq6unt3MnucL/QO3
	 mkIJZw0IvUEC2imdazVFPFDFffCJsv+wV3o4oqfcBiTJcy2j/6EdOvvE8SO557jktNegS
	 zUYJTpAhLr4Td2IKLFOgdJvwi8zKIsbgoGpMZnj4xAjslmc6Xyoc1JW2wGjnvT3EztQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616710;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HfIRXtiamPvyk/g4mWkTtGgE8cnuldH/j478MLukakw=;
	b=MMtkgagEdoK44SMWeDwQffQxIdPHlCCcNN0By0emXdY0K+DKJ6GBi+DFDZaDtwE7Lho+
	 FG+BCJkKfUsKbsTTv7xlZ/pJ7w6DHz0dxU5yGEuvNwr7jownd65ptT+5oFPkG3LUd32va
	 552vvst5kHBAPMYcX+r5kcXrP1T/V090KTXHOF0S+Kxxb1z0cDwXs8delm1a2lFpE5THB
	 S7rz16iUV6xgl1LWR+rezNH+iCophvB+1FEgFpwui+VwG1gBjhvOpYnKPk3LMtRQAJ6Qy
	 mpaPSXsK+E7E4m/P6DTfION3jc5m5J2JgvD5rG3vj2tIdGLE4LUo9ZXCehiExHqs5ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=selector1 header.b=QgePegkD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.64
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B842606A329
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 10:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B842606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=selector1 header.b=QgePegkD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vg/tXLn1ZFjitqAmrzyxIoBYXA4STWQPvIAVMOHdNEe0qXsfQXDI7gAsHtBZfbb/BbFURiTRWaWtPFBhwQHgG3krA3/5vLz3DiTYLZfptjFyZjZvz8NwDmgr+wsf6ewq9+KB+utlIVc1jo5F8fIXLrM87bBNjaixVfCbFf1IpiQY8dQXSlA7TSlnMaQ1VJDjPLoRh7hj3mPrtvdsWQvxP+fyde6Kp4n5R527wTH3hK034zlFNihfQfFZ5rYvKmuk9egVAmgq6oV9ireMknMejlbjIzgJQajQpELFrLEfTJsA5ZpmAngxvj+PrMdFiVOkke8/j9vvRzUX1sJgigPkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfIRXtiamPvyk/g4mWkTtGgE8cnuldH/j478MLukakw=;
 b=UrC98J1IzUjHpEL58H8lS7Z+/imJYNsFDsMv+Oow+S94ogWGPKgvQq7KJ0uRoYUgmQoTBabD0wqywcRlOQjy3K+GFnja6+wi9Fy7UAuxYZ+Qxvnb48XlZ9By9aFlUU6wF85krTqbkm/t3bILT3E5Pb7vssAoJs1lUS4YMmAXevQ0Ej/TxyPzH5NzQhAQFwHQVGIithpLlb+jcMuZGy6OW4ezFXj0z6fwqGt6E3pzoTVmrwg9tedfLYBEP3pNGH/NVbC236wShTC4ueBfMt3JIXz0g967qJNwwg+HhUJz6RbL9A653tgofQsk1m3JNeK1EFZ8f4bTdL4cR9owOCH6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfIRXtiamPvyk/g4mWkTtGgE8cnuldH/j478MLukakw=;
 b=QgePegkDBvAf6Ptrtq3sRs+ujkPJfdESM6F15VNh5O7IYmEqHPV34QiRP6XFpFEWK/wAQuiMPNnVsybv8woykda2WyRC4OCjfSvuDDiIiWdbo2ss9NbUheq9LfYGK7dvTvtdBTdW1VbiIrfGSGZ6GHTjrz30voYPU0ait1ZgnBjElkDzBUZMzh1GtnTh4E7Xlb1pypqj2luzABqKUn87PJj4HI5XGtnH79zjfwYxupgma/gY47uLdGECgN0gMJMEgljqMsHQfHUOPiILeR8X6CH6Jb6ReqFBFf317IH+qxmuSkFD8defERqNxfoNoI7rGgFC1G06A68M3321D2EjdA==
Received: from DS6PR11MB523643.namprd11.prod.outlook.com (2603:10b6:8:468::12)
 by PH0PR11MB7614.namprd11.prod.outlook.com (2603:10b6:510:28f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:51:46 +0000
Received: from DS6PR11MB523643.namprd11.prod.outlook.com
 ([fe80::1cc0:e019:a70b:f954]) by DS6PR11MB523643.namprd11.prod.outlook.com
 ([fe80::1cc0:e019:a70b:f954%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:51:45 +0000
From: <Manikandan.M@microchip.com>
To: <mwalle@kernel.org>, <sashiko-reviews@lists.linux.dev>,
	<pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <pengpeng@iscas.ac.cn>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a read-only
 NVMEM device
Thread-Topic: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Thread-Index: AQHdXVql4Kqh32JHyEicX8VyYnR6M7cBjRuAgBjHJYCAADAMgIAAMUeA
Date: Mon, 2 Nov 2026 10:51:45 +0000
Message-ID: <bb688ade-338c-43f4-adbc-205d7ad3c0e9@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com>
 <sashiko-outbox-175470@kernel.org>
 <ba131ca0-c659-419e-9ff7-26c7c6de1028@microchip.com>
 <DMKKB0CXCHFC.365E5XOS5BSE4@kernel.org>
In-Reply-To: <DMKKB0CXCHFC.365E5XOS5BSE4@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS6PR11MB523643:EE_|PH0PR11MB7614:EE_
x-ms-office365-filtering-correlation-id: 98f5220e-f966-408d-33cd-08df38cf49ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|921020|38070700021|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261021121427099003|261026140227099003|261022105027099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 MbW/U2NcAPYsL73rMIoCLcYir5lDH1fVYO45Wx3KZEuBsgvY4SiW3YhIt+Q7vqVpLmlLIGaTTc8F+4HxtkJ30o2xZZ8lRCh19PH95Owc/CtkZuyw652GfxMcv8d8aBYKj8I/rjCI/p/47zYHOUch41EtH6zELmmKg3c3qBduApRnaiG20+O6CKcYTCpCEzH4b1pFO0F+W0GlIvvwv3LiNvagMT5sA449BO3Rs+YTyTSyQDDLumKAFzwhdvjoO7h2AmJMeCdU04RBD9Us+CZteIU9iAKCsel0YoejzacrQyGZmLOryt/CIRp0bRyG8973V/i7mtSCPMdlr6US8nXXbyPO64QL2aMJ1PFRl10hx13XYaYLstaYCk8UichX0JgZnzc0ki0KXO32zRbOOMMxRcT1GtMiYpmUEilePoNMziZpmRMmCZcLTcrcT2kdJnMd3vEWO331Vsn90ZsKlPDTYsL3fOFw80C7Zhr223DRAC0D+OQ1xwfSGOgQTXesw602RcK4O0DLoUua34BkmDd7LUCJePKiYrZnmBjRNdEfZk9/LLRm/R7fGQcdd0oZ03rc/t9CLjjYGldJKV7dFtoeFycIgk48LUItgzuEk1EpC9oq2Mb1bg5wdPlunabkzsfFr071OIiEFooEow92iC6muyVY3T1yLG/J615WQqfY445GfEyDOpDb7EWEhiWY502iLiNzF2a0hDwkOvnQqYzj58DhHpgaVDOsvz9dXz+qHBvcI0WdbCQnKwwanVVS8EvN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB523643.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(921020)(38070700021)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajhURHFTSXdOVlQ4OVIyRUcvWTNPQUpnYXBIU0VQQjhpb01Idi9vNm5MbnRU?=
 =?utf-8?B?UHpOdVJPMTByMncxNHpLOFZLZ0Qrc09yOW13MW1SZ2NWU3A3dVd6QTJWRWFP?=
 =?utf-8?B?N0xyTDBhTUtHRVdGY3d2OXdOa1c1VXZqeEpVMjJ3aEFsdDdvWTJXOUl4TUUz?=
 =?utf-8?B?d3FxWXpzaDBKL3A1bms5Qk85bXEySjlwZ2EvUXdTSTM4Ymc1Z3IzMlR1cXNj?=
 =?utf-8?B?dlRSNUpkblkyUlpTQmJDRmNWWi8rdEJ2OHIrakFSRnZqY04zb0FQZGdoV2FM?=
 =?utf-8?B?VllBWlZXcERhODdaN1N0U2FHd0ZITWw2WE5lNVQxRnFQQlIycS9wWURFbDVx?=
 =?utf-8?B?UWU2RERTOXJMSG5xM3ZHVVByQ1ZHVkk1SXdjLzBUYkhvemtUMEhWeFU4cGNL?=
 =?utf-8?B?SzVqOTdJN0FnTHVkOGQvaUJmbHBVajNkcWt4WHJvS0ZFNVRTNC9iL2RRT1lJ?=
 =?utf-8?B?ek5LZllKUkhncnN5L2dxOXI2VGQzWlRNdWZoOWZVbHQyWnlUWmRvbUkrZFZ4?=
 =?utf-8?B?QmJqVlpUWmtnUmxLWWdsU3lsZEJnYklLdTFHN0oranc3STljczI5MzF0THZJ?=
 =?utf-8?B?a0VTa21tSGxDOXB5a3BHVnk5L0wwNmpSSG5Kd2FyS0xBVnk4Nm90TWIyeEVZ?=
 =?utf-8?B?ZDh6NEFiOUNxNkxUWk1XbFFFV1FacmNmRGc5N3FhVmx0NmNSam1pZEFjQUI1?=
 =?utf-8?B?NDI1R3pDR0k1RGVaUWZZMklvMUhESEhydTVJL3NXVWdWUWJ0SWgyQ3d3eUI4?=
 =?utf-8?B?YjFVK3NRd0tzYVljd3Q4NTVyNzVzbHYvMFR5bTBIejRQUU13VnQrL0NPcG5B?=
 =?utf-8?B?L0trNDUvQ2xxN3Z2cVdoWVh5QXRoN0JvZUcreDExZEkybmVLM2JSd21GRXND?=
 =?utf-8?B?Qyt0UFlMVnFRQ081RGZnOTMyZlVKVjNNVkI4TmNpdVN3TEVjOVMvL2ZOSGhi?=
 =?utf-8?B?dkZobnpOaTMrQTNBZjJUb0RML1dScENoa3kzMUFabU5tM2NQQ0ovbVowNHZn?=
 =?utf-8?B?UVZYcjhhWXRVNkN6RmxkSDNCUlVZYnJZTUFZUlpVT05Lc1Rwc2EzbTFsQXJh?=
 =?utf-8?B?MjdWVVJDY0NNSG4wRG5SMlQxYk14VGVza0tIcVBybVpyL1k5RSt0T0JIQWEy?=
 =?utf-8?B?VzB0UWUvUGE4bHFyUWVEOE9rUUVXY1dzTUJaL2ZIbTRKZ1Z6ejZIZEtmbElL?=
 =?utf-8?B?QmNOcklNTG9BaGNQdmZrSlVqRFljMERVWCs0OHl4ZWZKMDZyNDZ6NUJHaklm?=
 =?utf-8?B?WnAwZHAwMkdoY2FiczdmdU1NVHVwRjBEUXJEckF6UXJUOUdXZ1dPWWZ6VkFF?=
 =?utf-8?B?SFVsTFdYVWtpWE02clB2ckpvY2xsTW1FMHNQaSt5a1FKRFVVQXUzNDMwZzQy?=
 =?utf-8?B?bVpBNlM1aGNzck1mWk1XZEJ5SWFJWDBmRzZYc2xPN0NnZnRtVUsxdmttUkdO?=
 =?utf-8?B?NU5FL0FFVVNpWlJpNHVyUHEvaU1ndXE3ZmxCRlVVSENYcDVlZ0pqR2tYQmYv?=
 =?utf-8?B?S1l1TktCd09CT2tKWit2RlJjVUhQanp3bmxZMFVNY3FVVy90STI5Q1lrZEsw?=
 =?utf-8?B?WkNHNzRLbTI3OWhSNkJ1bnlFdGlKVzFwQUVTam52Y2VZalhrdHN2dngzeEZT?=
 =?utf-8?B?TWYrNU1QOUlySzdZQUZyTm9aVXFoK2p1aUhtcjR2Wm01ZjQyTU1WaTFPOUhM?=
 =?utf-8?B?ekQralNES1ZudU9SdjkvM0o4K1JEOE5aNm12dTRZQjdVMTRWSWtHQ3dOU1JB?=
 =?utf-8?B?dzZQSzEwYk92RTN5K3BPT1ZST2N4aXpRRjlIQUpoS0JlSXBLcjNxWG0yaCtS?=
 =?utf-8?B?MFFSaXNSNTZvdTZDSHpKWlgzcitVMldoUllFZ2JiRlZhb1NwcUpYaDRnaXE4?=
 =?utf-8?B?aTdINW94cm5Cc2oxZUo2V3ExTjNOSVRlYXNFVHlEbXozVVo3RVUrTUpKWVNI?=
 =?utf-8?B?OTdwd2lDM09SMmszR3hMWTZkdC9aVzlKbW0vcHRzWER2TnRJKzU3WmxFWlRB?=
 =?utf-8?B?VjQ3RnpzYUExVGhFZDVZa3FpbVlrSkQrNmJHOHhWZ3dkNWoyekVVQkI1djdt?=
 =?utf-8?B?WXp5MTAxdmFXUGVnZnZVQjV1bjBydEd1NnhibFI1eWtjRW43YVVEbVpKK3RE?=
 =?utf-8?B?Q3Q3aEl2LzJZYWtZNlhRd1JOZDNVQ2p2akpucXpjczVkd1NHakN3YXJ0dG8w?=
 =?utf-8?B?S1E4dEZEM3Y4QU1sOHNMZGV0Nms1NjVpU3RPb3FPYkR5SkRwQldIemJObDNE?=
 =?utf-8?B?UWdzejJSMERiNjJCcDhQSEZJTVVWYjZuM3RQcFlYQ2QvdjJReUREc2czUkg4?=
 =?utf-8?B?d2plYllPczdabEVlSjBnQkZERmRabWRHeGFGWitZa3UvQ3RHcjBidz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CD3A355A305404E9A1D23A4E75ED7DF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB523643.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f5220e-f966-408d-33cd-08df38cf49ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 10:51:45.4238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2EA80n0kQq6ELZ6I/ADjGyzS8h9EdNuLsEMsbib3dVmEsFfhwcfbwJ97Vc3WxscdlOVRz51Em//Oc6VJgPk8jwp1at0N2XPyN6iTZQsih0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7614

SGkgTWljaGFlbCwNCg0KT24gMTEvMi8yNiAxOjI1IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0K
PiBPbiBNb24gTm92IDIsIDIwMjYgYXQgNjowMyBBTSBDRVQsIE1hbmlrYW5kYW4uTSB3cm90ZToN
Cj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9yZWdpc3Rlcl9zZmRwX252bWVtKHN0cnVjdCBzcGlf
bm9yICpub3IpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IG5vci0+
ZGV2Ow0KPj4+PiArICAgICBzdHJ1Y3QgbnZtZW1fY29uZmlnIGNvbmZpZyA9IHsgfTsNCj4+Pj4g
KyAgICAgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW07DQo+Pj4+ICsgICAgIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnA7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgaWYgKCFub3ItPnNmZHApDQo+Pj4+ICsg
ICAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgbnAgPSBvZl9nZXRfY29t
cGF0aWJsZV9jaGlsZChkZXZfb2Zfbm9kZShkZXYpLCAiamVkZWMsc2ZkcCIpOw0KPj4+PiArDQo+
Pj4+ICsgICAgIGNvbmZpZy5kZXYgPSBkZXY7DQo+Pj4+ICsgICAgIGNvbmZpZy5vZl9ub2RlID0g
bnA7DQo+Pj4NCj4+PiBbU2V2ZXJpdHk6IEhpZ2hdDQo+Pj4gSWYgdGhlIGplZGVjLHNmZHAgY2hp
bGQgbm9kZSBpcyBtaXNzaW5nIGZyb20gdGhlIGRldmljZSB0cmVlLCBucCB3aWxsDQo+Pj4gYmUg
TlVMTCBhbmQgYXNzaWduZWQgdG8gY29uZmlnLm9mX25vZGUuIERvZXMgdGhpcyBpbmFkdmVydGVu
dGx5IHRyaWdnZXIgdGhlDQo+Pj4gTlZNRU0gY29yZSdzIGZhbGxiYWNrIGJlaGF2aW9yPw0KPj4+
DQo+Pj4gTG9va2luZyBhdCBudm1lbV9yZWdpc3RlcigpIGluIGRyaXZlcnMvbnZtZW0vY29yZS5j
LCB0aGVyZSBpcyBhIGZhbGxiYWNrDQo+Pj4gbWVjaGFuaXNtIGZvciBtaXNzaW5nIG5vZGVzOg0K
Pj4+DQo+Pj4gICAgICAgaWYgKGNvbmZpZy0+b2Zfbm9kZSkNCj4+PiAgICAgICAgICAgICAgIG52
bWVtLT5kZXYub2Zfbm9kZSA9IG9mX25vZGVfZ2V0KGNvbmZpZy0+b2Zfbm9kZSk7DQo+Pj4gICAg
ICAgZWxzZQ0KPj4+ICAgICAgICAgICAgICAgbnZtZW0tPmRldi5vZl9ub2RlID0gb2Zfbm9kZV9n
ZXQoY29uZmlnLT5kZXYtPm9mX25vZGUpOw0KPj4+DQo+Pj4gSWYgY29uZmlnLm9mX25vZGUgaXMg
TlVMTCwgdGhlIFNGRFAgTlZNRU0gZGV2aWNlIHdpbGwgaW5jb3JyZWN0bHkgaW5oZXJpdA0KPj4+
IHRoZSBTUEkgTk9SIGZsYXNoJ3MgbWFpbiBkZXZpY2Ugbm9kZS4NCj4+Pg0KPj4+IFRoZSBOVk1F
TSBjb3JlIHRoZW4gc2VhcmNoZXMgZm9yIGFuIG52bWVtLWxheW91dCBjaGlsZCBub2RlIGFuZCB3
aWxsDQo+Pj4gZmluZCB0aGUgbGF5b3V0IGludGVuZGVkIGZvciB0aGUgbWFpbiBmbGFzaCBtZW1v
cnksIGF0dGFjaGluZyBhbGwgTlZNRU0NCj4+PiBjZWxscyB0byB0aGUgc21hbGwgU0ZEUCBOVk1F
TSBkZXZpY2UgYW5kIG1hcmtpbmcgdGhlIGxheW91dCBub2RlIHBvcHVsYXRlZC4NCj4+Pg0KPj4+
IExhdGVyLCB3aGVuIHRoZSBNVEQgc3Vic3lzdGVtIHJlZ2lzdGVycyB0aGUgcHJpbWFyeSBOVk1F
TSBkZXZpY2UgZm9yIHRoZQ0KPj4+IGFjdHVhbCBmbGFzaCBjb250ZW50cywgaXQgd2lsbCBza2lw
IHRoZSBsYXlvdXQgbm9kZSBiZWNhdXNlIGl0IGlzIGFscmVhZHkNCj4+PiBtYXJrZWQgcG9wdWxh
dGVkLg0KPj4+DQo+Pj4gQ291bGQgYW55IGNvbnN1bWVyIGF0dGVtcHRpbmcgdG8gcmVhZCBhbiBO
Vk1FTSBjZWxsIHRoZW4gYmUgbWlzZGlyZWN0ZWQNCj4+PiB0byB0aGUgc21hbGwgU0ZEUCBOVk1F
TSBkZXZpY2UncyByZWFkIGNhbGxiYWNrIGluc3RlYWQgb2YgdGhlIG1haW4gZmxhc2gsDQo+Pj4g
cmVzdWx0aW5nIGluIC1FSU5WQUwgYm91bmRzIGNoZWNrIGVycm9ycyBvciBjb3JydXB0ZWQgZGF0
YT8NCj4+DQo+PiBZZXMsIHRoaXMgaXMgYSB2YWxpZCBpc3N1ZS4gV2l0aCBubyAiamVkZWMsc2Zk
cCIgbm9kZSwgbnZtZW1fcmVnaXN0ZXIoKQ0KPj4gZmFsbHMgYmFjayB0byB0aGUgZmxhc2gncyBv
d24gbm9kZSwgc28gdGhlIFNGRFAgTlZNRU0gZGV2aWNlIHdvdWxkIGNsYWltDQo+PiBhbiAibnZt
ZW0tbGF5b3V0IiBtZWFudCBmb3IgdGhlIHdob2xlIGZsYXNoLg0KPj4NCj4+IE1pY2hhZWwsDQo+
PiB0aGlzIGNvbWVzIGZyb20gZHJvcHBpbmcgdGhlICJpZiAoIW5wKSByZXR1cm4gMDsiIGNoZWNr
IGluIHY5LiBJJ2xsDQo+PiBicmluZyBpdCBiYWNrIGluIHYxMDogd2l0aG91dCBhICJqZWRlYyxz
ZmRwIiBub2RlIHRoZXJlIGlzIG5vd2hlcmUgdG8NCj4+IGRlc2NyaWJlIFNGRFAgY2VsbHMsIHNv
IHRoZSBTRkRQIE5WTUVNIGRldmljZSB3b3VsZCBoYXZlIG5vIGNvbnN1bWVycywNCj4gDQo+IFRo
ZXJlIGlzIG5vIERUIHVzZXIsIHllcy4gQnV0IHRoZXJlIGlzIHRoZW4gYSAic2ZkcE4iIGZpbGUg
aW4gc3lzZnMNCj4gd2hpY2ggY2FuIGJlIHVzZWQgZnJvbSB1c2VyIHNwYWNlLiBBbmQgdGhhdCdz
IHdoYXQgbXkgZmlyc3QgcmVtYXJrDQo+IHdhcyBhYm91dC4gV2h5IHdvdWxkIHRoYXQgb25seSBl
eGlzdCBpZiB0aGVyZSBpcyBhICJqZWRlYyxzZmRwIg0KPiBjaGlsZCBpbiB0aGUgZGV2aWNlIHRy
ZWUuDQpBZ3JlZWQsIEkgbWlzc2VkIHRoZSBzeXNmcyB1c2VyLCBJJ2xsIGtlZXAgcmVnaXN0ZXJp
bmcgdGhlIGRldmljZSANCndpdGhvdXQgYSAiamVkZWMsc2ZkcCIgbm9kZSBpbiB2MTAsIGFzIGlu
IHY5Lg0KDQpUaGUgY2FzZSBTYXNoaWtvIHJlcG9ydGVkIGNvbWVzIGZyb20gdGhlIG9mX25vZGUg
ZmFsbGJhY2sgaW4gDQpudm1lbV9yZWdpc3RlcigpIHJhdGhlciB0aGFuIGZyb20gdGhpcyBwYXRj
aCwgYSBmbGFnKG5ldyBmaWVsZCkgaW4gDQpzdHJ1Y3QgbnZtZW1fY29uZmlnIHRvIHNraXAgdGhh
dCBmYWxsYmFjayB3b3VsZCBmaXgsIEknbGwgbGVhdmUgaXQgb3V0IA0Kb2YgdGhpcyBzZXJpZXMu
DQo+IA0KPj4gd2hpbGUgcmVnaXN0ZXJpbmcgaXQgY2FuIHRha2Ugb3ZlciB0aGUgZmxhc2gncyBs
YXlvdXQuDQo+PiBEbyB5b3UgaGF2ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbnM/DQo+IA0KPiBQcm9i
YWJseSB0ZWxsIG52bWVtIHRvIG5vdCBhdHRhY2ggaXQgdG8gYW55IG9mX25vZGU/DQo+IA0KPiAt
bWljaGFlbA0KDQoNCi0tIA0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTWFuaWthbmRhbiBNLg0K
