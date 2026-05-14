Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0BB33689B
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 22:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778796132; cv=fail; b=mGZoqNA4ZbD2z7BzqeItC02557RLr8zfFhK6e3NjcSG43klASDyq1mhAziWiU4rb4X9448iw0RVWNjF05hATz1zzuVuef47YMFP2CdGQij9HQRfEH/KzZiF3IbYre2woQaPbwPZ6tsXtrdW5B98yKaYcyRObhujFqRM4bEi0y4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778796132; c=relaxed/simple;
	bh=xuvMEsEC/DAn6/ir7vkyJ9Hlm6C5lACIzj4Hsh+NG8M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LOHBHEBFA22Ej10Od96FWClsF2Gl6TMhvbzSRfvvHcSbysS5xuPYguNtL7UPAhl+fwr1yRGoahLc0fzA4EjpZpTXsJnGHXAAe1D1DEAz8trtEtQ8WRdxVkqdjstQCEng8LAZ7r5AW2TS7AGWtu0jOoboB3cEm6WchjiYoGjD12w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LtrdO24g; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LtrdO24g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etMsWFNyRyjPJByODH4NrWriVv9GonjuSHf4ZByFcjRPr4OAVxAW8pJJd/Ixizoxj/02a5hXYxnCXQ4NWxfxfrNwU2IjbkvBUPssp9bexyyzhrKDPwcuzx2gBNhRIm8c9hIKqooMDZc7bmdejIva0j6LEXI1JHGCbZUzjObnSP/Uq+0pX8EZfbbmq1K6POB0KptZTzk8mHXA1zKzYGdDLJV2S7T9FTK8n9fEyP1CGCghi3IsvRfJZhRl21/ow2ldXsmN8hQQkTiRAC24/LuX00/5eGCAEATLnjcqmoB0j2ACTt8JdMzdkz8Q9SpdLMuHjHHKhq1ZMaYOyryOvUuZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuvMEsEC/DAn6/ir7vkyJ9Hlm6C5lACIzj4Hsh+NG8M=;
 b=Fy3x+tQFdDENaLLEC+fObcxTV3SRJbwx1J1gEgheCOgVA7wYjxeb08elBRmgCM/kc4+PM7/7doqFA6BO3swgN2mbTKu/K8NdC0NQt/h6sT5UiGjZ0pcapF8hDS4eVWHX15zBUozyUp8JIBA8X6zIKdRMIU6NC915NpzGHJSkzltJdNnOXf7PtJPRUOqi18KE70ml23y+rP8zhET3PECx8UKCPrtgV2ApJjKSYNtpAWB7/cKZQqrkcCVjpVWCUiu/I9WzD470pbbYrQK8B/G1uCRphfsAE9RMRkmX2aJoRr1kL4m8UMbDWCjbemDDmyXVsCSfUb5LI+NDkfswMb8QzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuvMEsEC/DAn6/ir7vkyJ9Hlm6C5lACIzj4Hsh+NG8M=;
 b=LtrdO24gaRej+irPRUKPQf+V9WXPeTjm6vl1yXcIna0UooD2gjR+dqkH2wzz9tJRVIhoLbFwNRJahhkbAr5nwaL/f6PabohTMjcu7sp2Yriw3IL8bQuGX41IHyvuvGcT5M6MGjA2tM9N4WKHNFQFUVuYp5ZLVqnbBAET1xRugg8=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY3PR01MB11072.jpnprd01.prod.outlook.com (2603:1096:400:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Thu, 14 May
 2026 22:02:07 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:02:02 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v6 03/16] ASoC: rsnd: Add reset controller support to
 rsnd_mod
Thread-Topic: [PATCH v6 03/16] ASoC: rsnd: Add reset controller support to
 rsnd_mod
Thread-Index: AQHc4j0RPrH7aLHzDE2Zj+mIYyKPzrYMpskAgAFpi+A=
Date: Thu, 14 May 2026 22:02:02 +0000
Message-ID:
 <TY6PR01MB17377FEBDBED7CAFB6172F6F9FF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-4-john.madieu.xa@bp.renesas.com>
 <20260514000720.8EE14C19425@smtp.kernel.org>
In-Reply-To: <20260514000720.8EE14C19425@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY3PR01MB11072:EE_
x-ms-office365-filtering-correlation-id: b670a67b-b0e1-4539-b58c-08deb2046df3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003|11063799003|4143699003;
x-microsoft-antispam-message-info:
 3gXIxGXnEMvzL9VX129DnhmIo7tBXZ20UJeNvC4nR9Y08KR9TmA0/bVdnEuN5NsRjl27zic5llU1iI2lEUJGGmxPdyXElQ8F9ZJtQ76BAfy32dKrTorcciTRs8C9N/QbD+SimoDVlIUw8LkmFgwF+5aT6FaV56vuRL5Yl9RW+eyddGNTBgbADW9EmXlu6Avp+1Zq5sH52hR2vfsnacGDBQLdg9ayBG7rbmcZgGsNUNjb0nybqoDhCOZyBROBMPe3g/T+CgFHyES1Sb2hvKjjTWisk8No7RZYz69azSNDWLJHyMSHnhRqIlI7DjjlGzFi52xZ4X9rwfile0gY6ZSgPMtV4d9pAXQZgKz+0Fetn8RwxiDTJ10m59zBRudfgVFNShMtC7rYlUIbr/VL1akz4od5m/aG0BSMZzg2UdRQqPumR48YcM158J5UZiz3hEQRTgnlKTgtSWQtETffwSt9TJpPh7nf2bdaOeV9+iN+3e3KusAo1PSlYFx3vQQD93aaj2tF1UrgOTC+zU7LEoNcp29zL2dHB0fq5auhSCGqzzHBADDBHvMzUKextc8m6hh0wVQoTsn5xJXTErXACNNtFRIDcvGo7gg3jhPmeFi+AkBg0HeTDNxo0mF2y5q1QjZGu9QFCBcYkMj6I0MIRrCAMe5pSuxe0ko+XjQEs9oCPNIKac9s2xx+Rbecz9WcnbBFUBqar6KHvPU2jtsXlKSLZGFXJCGZ7NDpq1E5Qs35A2VdbFoeRPVOa8Ar0NZS//rL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzhFYjF5ayt5cW8va1J5WVJNd0MyV2F3MS9KbnNmaldidGhvQ21KYjNObjUw?=
 =?utf-8?B?UkhKMm00ME1OVUU0TlM2R1g3a2tDTjljWktPZVQycmd3TUVXR2R0bjluelBE?=
 =?utf-8?B?UElISENqV0dmYmdjSlQ5TmJZV1JCa0VkMlVRRy9TaDd2QmxuSDI5bmFOZTB4?=
 =?utf-8?B?WDJVZmVhaEtZOFU1N2Y0MDVrNjhTa2FNSGNZR1labzN4OGRPYnlzUVcyY3hk?=
 =?utf-8?B?d0VWZ2EwUURXYk9XdjNTVnEvL2F5WEdNbjNwMGhXODUwNWpHWWFFeitXK0Jx?=
 =?utf-8?B?VldMTWFvZTJmb3ZGV1hyMW53dkpkSFJBMUJ5c2NZdXYvMzVkM0Nzem5QUkw1?=
 =?utf-8?B?Wk1vRzNPN3B3L1FqRmg3M0VVMkxlUmw0clBHRUhiUGI5UVM1WVNpNU1ETTZE?=
 =?utf-8?B?TnlwYmF2VnFCVHM2WDlYaFc5MHBYS0E0SHh3V2JXUXI4WkhyMDFFaXNvam1n?=
 =?utf-8?B?V2cyaFFFbWJtQzlXb3F5Z3lsOCtEcndCeDhkVm96b0VXb0NMT1lqak55OHNw?=
 =?utf-8?B?V3FNb2ltNCtCRjFQaUZKOHkrN0ZmNGtjTnBEUlNkYlJmZ2k1aDFFWVgrNUJz?=
 =?utf-8?B?cXdqMG5kaWw5WUZDQVNJazcyQVpGTFZWYkNXRDB6MkYyUzlwTCtEMUpTS2kx?=
 =?utf-8?B?c0IxMitIUG1sb0QzNnpsRkh1M2g2eTRpYmVhR1JkMk5yRUgzWnA1M3B5NXln?=
 =?utf-8?B?bWh3NWlhcFVOODZDMWZ2MFpzeUFKWjNwYTRCRXdZSzIzdnZJc1hGVDJWOXp2?=
 =?utf-8?B?TUpPTUEwd255dlV1dCtvWXpmWnpNcVpVRW8yMk5VSDR4Q2RWWEorUGpJS2Uv?=
 =?utf-8?B?NytLaWpXdEo2cGJjUWp1eGR2M3RqbE9qVi95R1hFYVRSYzZ5NGYyNzdOUjkw?=
 =?utf-8?B?bEphWWN4YS8rVTVsRXpwNHhVaC9wUnU4MWZmanpLeUgwZHQ5VHg0U1BMT295?=
 =?utf-8?B?TUJTczcyVVJrcTV3c3VtcnRWVWZ0V3ZlSWdud01VQlN2Nk5JczRxc3Y3eHpp?=
 =?utf-8?B?U2FmVWMzMHk0SklxbkNaUHhMeDBHSCtvUEhWWElqSVZDRXNwNFZFUlkrSTFG?=
 =?utf-8?B?MVgxTTBQZkxtZEhxM1p0cWFjYXdNZ2xtOWRNMnFKUTU1ZGVua3lOTXBnNUg0?=
 =?utf-8?B?bkVuVFJlcXIvR1A2UFl6cXJaRUdDdmwzdkR6VmVFa1VVY2daczBpbEdVeDY5?=
 =?utf-8?B?UHViWDV0T0k2MU4xYTM1VkgrTWFnYU1KZ1paMVRGNHVWNFBBV09FcVAySi8r?=
 =?utf-8?B?SUxzSlNhRmh5d2Jjbm4vMCswNVFoY0I4eUlOM1BWWXlwamx6NnZHY3VIbXFy?=
 =?utf-8?B?dTVDbnZjdDMwMU1ydW51U1hURDcvWERBQVBSbTQ1R3pHaWlnRkswT3lUMENh?=
 =?utf-8?B?UHJXUkszcnNrZVRCWmsyRWRwQTlkb09DQnVQWWljWkJhZE5CdTlpd3dKa1NQ?=
 =?utf-8?B?TmV1Uk1MTGJzUndLUWN1bmtjR3pSYmJhRFNXUEN6aERtRGE0T2JCai9lSzF5?=
 =?utf-8?B?RGZMay9nWmZKOVNCeFd5M1ZFUDhHb2FqeXB0TFBodThzcmNyLzF6WFAxMWJH?=
 =?utf-8?B?RG45a2F2WTZUZGp0ZmRQR1dBb2g4djVYK0pzMU1NbTdLd2JadlRMZnRLd2l2?=
 =?utf-8?B?NFcwemdOK3o2eC9hTzkyZHJONnVzMVk1cmsybHA3WkZSekxrWU10TDdMVDlX?=
 =?utf-8?B?UGNaR1B6bHNJTS9ESlBHYXdSSmxBWWNtT3QvWStvaXJpVm1wWlRwcFZDK0Zl?=
 =?utf-8?B?a3NEcWVSVHExQXFaL3g2djFoZnExUXhDNU51cFBvRHk0NlhwMmMxS0FEckR5?=
 =?utf-8?B?cUI5QUIwZzVmZHFzc1k5bVFqeWxSTmw0U1o3ZDMwZXBiT3RoK0JhcnlUK25i?=
 =?utf-8?B?TnJ4L1ZtMjdkOWFtSHdyWHYrYXZCYmg1eHNSZ0hXOXBrWHBGRzZDbS9DNU9m?=
 =?utf-8?B?SEFoRHcxa3dxcmZoRnBQZFA4Z0hNVi9UT0xPeVdQeWNBZFY3eTk5VUt5cHpm?=
 =?utf-8?B?WHpjQmxQbGR6U3Y2MDBZRlJEcnY0cFFnbDNtZmprTkc3VFI1S1FPUXNSTUxC?=
 =?utf-8?B?SitCcy8rK2RPQ1V6Q2pqWVBzWGFDZjhIS01KbkYxVC91aStxYmFMNDNQYnJs?=
 =?utf-8?B?M0txNjdkMVFtMDdYSGxhWlIxWThhYjlib1lnU2w1NnBvbG5TUytqOW02VzRR?=
 =?utf-8?B?ZGdOcENVejFlZ08rNTNkSTgzdUxxemRBd3JGN3d1OW1rMGRaSmJkQkFPUURQ?=
 =?utf-8?B?b1hpeEtYYWl3QXVKQ2RjWDFqUVRHK1hmdG56b0s0d1UyazhabXByRmhxcWR5?=
 =?utf-8?B?dHBzWEs3N3NIL1JXUWoxNGZFTVlpNVV3ZVlpNXZ0NVdJVDRUMDkreEhEaFlv?=
 =?utf-8?Q?28WifKUFcwem4VGI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b670a67b-b0e1-4539-b58c-08deb2046df3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:02:02.7118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWvXZCE3U17o3lIKQaia15Leobj0/JW+J7Ut9jLq2WtWV+zffipO+AGwH4NdIQ3L4SsUzOZcXNrj1Wfs7u/cOAwWS7UQ5aWWUjdlaXjqLXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11072

SGksDQoNClRoYW5rcyBmb3J0IGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnPg0KPiBTZW50OiBEb25uZXJzdGFnLCAxNC4gTWFpIDIwMjYgMDI6MDcNCj4gVG86IEpvaG4g
TWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NiAwMy8xNl0gQVNvQzogcnNuZDogQWRkIHJlc2V0IGNvbnRyb2xsZXIgc3VwcG9ydCB0
bw0KPiByc25kX21vZA0KPiANCj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBzYXNo
aWtvLWJvdEBrZXJuZWwub3JnLiBMZWFybiB3aHkgdGhpcyBpcw0KPiBpbXBvcnRhbnQgYXQgaHR0
cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IFRoYW5r
IHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDIgcG90
ZW50aWFsDQo+IGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBJbmNvcnJlY3QgaGFy
ZHdhcmUgdGVhcmRvd24gc2VxdWVuY2UgaW4gYHJzbmRfbW9kX3F1aXQoKWAuDQo+IC0gW0xvd10g
VW51c2VkIGA8bGludXgvZGVsYXkuaD5gIGhlYWRlciBpbmNsdXNpb24uDQo+IC0tDQo+IA0KPiBj
b21taXQgMTVlYmM0YmM1ZWVlMDg3MTE1ZDA5NzFlMGI4YTVmNTkwOTBjOWM4Mg0KPiBBdXRob3I6
IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IEFTb0M6
IHJzbmQ6IEFkZCByZXNldCBjb250cm9sbGVyIHN1cHBvcnQgdG8gcnNuZF9tb2QNCj4gDQo+IFRo
aXMgY29tbWl0IGFkZHMgcmVzZXQgY29udHJvbGxlciBzdXBwb3J0IHRvIHRoZSBSZW5lc2FzIHNv
dW5kIChyc25kKQ0KPiBtb2R1bGUuDQo+IEl0IHVwZGF0ZXMgcnNuZF9tb2RfaW5pdCB0byBhY2Nl
cHQgYSByZXNldCBjb250cm9sIHBhcmFtZXRlciwgZGVhc3NlcnRzIGl0DQo+IGR1cmluZyBpbml0
aWFsaXphdGlvbiwgYW5kIG1pcnJvcnMgdGhpcyB3aXRoIGFuIGFzc2VydCBpbiByc25kX21vZF9x
dWl0Lg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3JlbmVzYXMvcmNhci9jb3JlLmMN
Cj4gPiBiL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvY29yZS5jIGluZGV4IDJkYzA3ODM1ODYxMmQu
LmMzYzEzOWE2ZmM2MGENCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2MvcmVuZXNhcy9y
Y2FyL2NvcmUuYw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9yZW5lc2FzL3JjYXIvY29yZS5jDQo+ID4g
QEAgLTkwLDYgKzkwLDcgQEANCj4gPiAgICoNCj4gPiAgICovDQo+ID4NCj4gPiArI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+DQo+IA0KPiBUaGlzIGlzbid0IGEgYnVnLCBidXQgaXMgdGhlIGluY2x1
c2lvbiBvZiBsaW51eC9kZWxheS5oIG5lY2Vzc2FyeT8NCg0KQ29ycmVjdCwgbm8gZGVsYXkgZnVu
Y3Rpb24gaXMgdXNlZC4gV2lsbCBkcm9wIHRoZSBpbmNsdWRlIGluIHY3Lg0KDQo+IA0KPiBJIGRv
bid0IHNlZSBhbnkgZGVsYXkgZnVuY3Rpb25zIHVzZWQgaW4gdGhlIHVwZGF0ZWQgY29kZS4gV2Fz
IGEgaGFyZHdhcmUNCj4gc3RhYmlsaXphdGlvbiBkZWxheSBpbnRlbmRlZCBhZnRlciB0aGUgcmVz
ZXRfY29udHJvbF9kZWFzc2VydCgpIGNhbGwsIG9yDQo+IGNhbiB0aGlzIGluY2x1c2lvbiBiZSBz
YWZlbHkgcmVtb3ZlZD8NCj4gDQo+IFsgLi4uIF0NCj4gPiBAQCAtMjE3LDYgKzIyOSw4IEBAIHZv
aWQgcnNuZF9tb2RfcXVpdChzdHJ1Y3QgcnNuZF9tb2QgKm1vZCkgIHsNCj4gPiAgICAgICBjbGtf
dW5wcmVwYXJlKG1vZC0+Y2xrKTsNCj4gPiAgICAgICBtb2QtPmNsayA9IE5VTEw7DQo+ID4gKyAg
ICAgcmVzZXRfY29udHJvbF9hc3NlcnQobW9kLT5yc3RjKTsNCj4gDQo+IERvZXMgdGhlIGhhcmR3
YXJlIHJlcXVpcmUgdGhlIGNsb2NrIHRvIGJlIHJ1bm5pbmcgdG8gbGF0Y2ggdGhlIHJlc2V0IHN0
YXRlDQo+IGNoYW5nZT8NCj4gDQo+IEluIHJzbmRfbW9kX2luaXQoKSwgdGhlIGluaXRpYWxpemF0
aW9uIHNlcXVlbmNlIGVuYWJsZXMgdGhlIGNsb2NrIGJlZm9yZQ0KPiBkZWFzc2VydGluZyB0aGUg
cmVzZXQuIFRoaXMgc3VnZ2VzdHMgdGhlIElQIGJsb2NrIG5lZWRzIGFuIGFjdGl2ZSBjbG9jayB0
bw0KPiBwcm9wYWdhdGUgdGhlIHJlc2V0Lg0KPiANCj4gSG93ZXZlciwgaW4gcnNuZF9tb2RfcXVp
dCgpLCBjbGtfdW5wcmVwYXJlKCkgaXMgY2FsbGVkIGJlZm9yZQ0KPiByZXNldF9jb250cm9sX2Fz
c2VydCgpLiBTaW5jZSB0aGUgY2xvY2sgaXMgdW5wcmVwYXJlZCBhbmQgbm90IGVuYWJsZWQgd2hl
bg0KPiB0aGUgcmVzZXQgaXMgYXNzZXJ0ZWQsIGNhbiB0aGUgaGFyZHdhcmUgZmFpbCB0byBsYXRj
aCB0aGUgcmVzZXQgc3RhdGUsIG9yDQo+IHBvdGVudGlhbGx5IGhhbmcgdGhlIGJ1cyB3aGVuIHRo
ZSByZXNldCBjb250cm9sbGVyIGFjY2Vzc2VzIGEgcG93ZXJlZC1kb3duDQo+IGRvbWFpbj8NCj4g
DQo+IFNob3VsZCB0aGUgdGVhcmRvd24gc2VxdWVuY2UgbWlycm9yIHRoZSBpbml0aWFsaXphdGlv
biBieSB0ZW1wb3JhcmlseQ0KPiBlbmFibGluZyB0aGUgY2xvY2ssIGFzc2VydGluZyB0aGUgcmVz
ZXQsIGFuZCB0aGVuIGRpc2FibGluZyBhbmQNCj4gdW5wcmVwYXJpbmcgdGhlIGNsb2NrPw0KPiAN
Cj4gQWxzbywgYSBsYXRlciBwYXRjaCBpbiB0aGUgc2VyaWVzIChBU29DOiByc25kOiBBZGQgc3lz
dGVtIHN1c3BlbmQvcmVzdW1lDQo+IHN1cHBvcnQpIGFwcGVhcnMgdG8gaW50cm9kdWNlIHJzbmRf
c3VzcGVuZF9jbGtfcmVzZXQoKSB3aGljaCByZXBlYXRzIHRoaXMNCj4gZXhhY3Qgc2VxdWVuY2Ug
b2YgYW4gdW5wcmVwYXJlZCBjbG9jayBmb2xsb3dlZCBieSByZXNldCBhc3NlcnRpb24uDQoNCldp
bGwgbWlycm9yIHRoZSBpbml0IG9yZGVyOiBhc3NlcnQgdGhlIHJlc2V0IHdoaWxlIHRoZSBjbG9j
ayBpcw0Kc3RpbGwgdXAsIHRoZW4gZHJvcCB0aGUgY2xvY2suDQoNClJlZ2FyZHMsDQpKb2huDQoN
Cg==
