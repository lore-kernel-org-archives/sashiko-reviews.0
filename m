Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421F6377A87;
	Wed, 16 Sep 2026 19:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789585768; cv=fail; b=Pg4ChwQhUeJZINhgArDgYoEO3CQJcwCkouzyJeuzhzcuCzSp7kFtIpgK8PS7fpxVUrjxG8c+bLToSZ2z2h2ig3xFXQtllmaoNQpzB+NdBsgKYxsuyH3jH2fSCy3GUpf0t/M2+MnRFJ6Zz6rBe3f24e+TC7t34SDc0ktpocspEpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789585768; c=relaxed/simple;
	bh=IsZAbZcVcFdqCJ7dCvu1Em7IQTZSnG7i1IMOn0kTMzw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rAJFLgrnanPU82DgfnTW3RHpCIREnA0uvIQUhAUoAJEGOyex9A3aRQLGnfHFE1vczSVi3yXcZ8rqvuvmbp4+pXwzKyJSIIDsW39EL8SmmPGRD/V+eW+baVrSeirlVy2xd4YWPyPlQxAS3nzX8iNeh7RuUKx8z0Opa1bc82pwgCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QoqIH32U; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QoqIH32U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSU9aJH7e+hEeeBDKNaY7GyujMqLRcfgNEosL5g+0oAT0QyaiGcJ7b0oFVQq/unx2cBbCjJ7+0fG79IsJ3RDdEA9yDFhILj7FYErfod1nql+x9/qgyKgK66oSo9hOrZA7OwrwoYhpFJV5IHkpNOAXOnINijn+xhNF1wwKvRXCYOozWbxFq8QIE3FyEvrR7Odw/kJ4VASpJsqSsM/TpCeCjwmDwSgIHShs1Yv0/lE+3KZB5/dF7ySHv0zN1VK1mmiJtwovQIQODoUACuVLqyBtNNR+UJPLsGvVp+zJnc879u+M2j6dWVzN4W+YVWXKZ1pTN9rQiMvB1+qgmAxg2mOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsZAbZcVcFdqCJ7dCvu1Em7IQTZSnG7i1IMOn0kTMzw=;
 b=p89D6V3o0HssuB7Jn8QQaAcyG5YsvpOuoVLVq/PBlbd0p+2eKK/ufsya6H6DZuEUhZAZOA5/0Js8Epx/itSNtE3w1Bg8UGVKFHl7I1MJorOMrm9ZwkqQjM1uTqUTwlRaW+s749qU1TOwVkFU7ZtfnKr6uNqjQf6vAbLIOvuzOEOPTY5fHY46dC5mjWITYcsT7FrEGsdjhpl8OF/r5aMzlHnCDlwUCDk4w3F5VO8Qozu72yLdb6JT+IUKqS9f9+v1YLr7+XnCW5DFbv7z+K2Ozl/Jg1phxVO6kNyQBkVadPFUoVj7uZJ58BrDBDknqWPogcFGSJUxtldLnAVrdUlnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsZAbZcVcFdqCJ7dCvu1Em7IQTZSnG7i1IMOn0kTMzw=;
 b=QoqIH32UpLRIfrgCnWzp/2FK7FqYcqQwltxcrMlECrUXjlx0sNLSFFWu1SFpb/bdO4jmV7F5fmW88qUm1HIoxGumz3f538p3AWNN2gsowVafCesE9m5vbwH0oA2bJ1tObVqanaHTV7zjtAhE7ZHFgJaf23xCFP8/AiJyLi3dFlo=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by OSCPR01MB16032.jpnprd01.prod.outlook.com
 (2603:1096:604:3e6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 19:09:10 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 19:09:10 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "mfd@lists.linux.dev" <mfd@lists.linux.dev>, "lee@kernel.org"
	<lee@kernel.org>
Subject: RE: [PATCH 2/3] mfd: rz-mtu3: reuse shared_reg_update_bit() in
 start_stop_ch()
Thread-Topic: [PATCH 2/3] mfd: rz-mtu3: reuse shared_reg_update_bit() in
 start_stop_ch()
Thread-Index: AQHdRIXd7233GcAsDU+nkIYuWzKBbLbOhSMAgAMPb0A=
Date: Wed, 16 Sep 2026 19:09:10 +0000
Message-ID:
 <TYRPR01MB156199CE8C86442683B0EA54785B92@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914201456.2018403-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914202450.B49F01F008BF@smtp.kernel.org>
In-Reply-To: <20260914202450.B49F01F008BF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|OSCPR01MB16032:EE_
x-ms-office365-filtering-correlation-id: d15825b9-195a-4cbf-f0d2-08df1425fd6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 clmK65H+8X2ocbpE0zue3ERCQs4Gl9FBGKrE0zi3i+5DScMeiA+Cb70waJJeAIF1CplwoKFZuSkbzYmKGZOr1YWRU0b3QzZ/nUJnjHtPT/O+tMZfBViUKz4VWTdagDOecX4d+LCxop9hOb1WmjVKKajZ98qjTGYPsXvwt4D7+RD4glXcBlgGthbSojMF4fe7GUe9hCRLR5hA9It2Z1IwI3RKoWBxYvMN96DllOeKLiUUOBZt768OKBTRXicd8b6REoOmmDuVMpXbQXGVgWwyQRY5U+jYE77I01g3RKW2+AjGz/2PwH/W69exuXlHVPuMErq2H4obds0NzbVImcFNclMfK0OWLt1auamXBX8r1BdVhoIJ2CJ66JrIamkhQnoRvEckYqkeLp+qtvAUW1wjltIVS+p7M8yYYZdQ20vA1kqyrTWkW2ETkXoamZ9rUuqhQPuOo7ydjtxi1QhUb47wSltUEDIQX7CsCVGVZr6qu7pLdBEdG118Y0AAz48ZtM7haRa8i3qYSvHWzEUbZ2HSjN9te5/S8ovPsqbVbOZrDzITcubQUU/+bNTvNvMuA+b42dclE5NWW+yrD7g93zwCbf8Iktxb5BT4TEwThqo6b1b0RmHTn/zB2gTBYyYoSsQwPcy4ekjUM95V7q//bQjv+VaV6wQ+9iEMoptjPGnoiSo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3NHUjl4Z0RMdXVYeGwzUHJvc3Q2LzdIdGVJTFN2ZnN3MWpoTW4xRS9rYmJy?=
 =?utf-8?B?Z2plZkh3MTEyNW16QlppL0tRWm1jYWFRN2VuLzFidThDVnFuUUVJSWd3Ukpi?=
 =?utf-8?B?WVJOMGtLaGsrVExaK3lqTFB5bm16dTEzMm1xcFBVQ3JmbE0zRWh0VGRtaTI3?=
 =?utf-8?B?ZzVacjc5SzJ2ejNEN3pWVGpma1BrcTJLREpUZFl5cEkwRUI4b1FYZ2JOdWhm?=
 =?utf-8?B?N0twdFlyM3hJOGR2OUkrRU9uTFE2L0Z4Rm80Y0VlNFZ4Vi9KZ3VzQkY0dXor?=
 =?utf-8?B?dk1NbFp5OE9PY2orMTVIc1FDMm5VYk5nMXJGYzk0NUZRclAvcDJ3SWMzczFJ?=
 =?utf-8?B?QWNoS1VzZUI3RzBpMXd4U0FtZ2I3OWhvUi9KTzB0UzJVWmhJeUg2VXdJTzd1?=
 =?utf-8?B?T3lrNXVSQkEvbzFFcTVmREUwWURTNlZsRGprZ3oxNUo1Qi81WmNpMVA5S3VF?=
 =?utf-8?B?eExnajhDN3N3clhHNlRBUFZzUEFsTHpOemNtaGhGY2JDeGFVQlBZbVZ6emsz?=
 =?utf-8?B?bi9HQ0ZWT29FV0NNVnJFZjdVTGU4RUhjbUp1V09qRVhFZk0zdDdCb1duenZJ?=
 =?utf-8?B?TWsvN05YRDYxZFY0bDZtMXVRa0RtZ3d4S00yVVN6bFRsUVJRZmtqbVRnYkJh?=
 =?utf-8?B?cXhINmFLYmpDSkJ3STJOcmJpQmFqQjVOZ1ZsK1JzR1dYcndKVS95TWw1eHd0?=
 =?utf-8?B?cXZtOW1mVlJkaXZOb28zelBmSjBaclpac1VxUmxzYmlMajltTUFhNjJRNktD?=
 =?utf-8?B?ODVJTk52UEhHeituMjgyeGtERkhtbTFuY0FFRmIzNEl3V2RZdEo3RHJubnk1?=
 =?utf-8?B?bDQzeU0zNDZJMzJoTitRaFBmcU9OeisrUDBqUldUSkM3dEFmdmZKTXZ3Y0ts?=
 =?utf-8?B?NmhLOGVsaGF6aTM0Tk9NT2lxNXhQOXlCK1NsdHorWnNTL2UwL1Bjanl6aHBq?=
 =?utf-8?B?cVJHdzArODNzMVVuNW1ROXFqOGFBYWNncXh1cDByN2RlZ3RyUGhmc3ErWi83?=
 =?utf-8?B?a1pPVEdPaHZJbFlpeHVwRlE4WnJacm01czhGQlZxSU9Bb2hXbW9EdzhtMzhs?=
 =?utf-8?B?NWQwMkRQQ2J1WDJRZjFyK1hXbk9CSTVsUitIMTRJWlF6MWtEZlloYTc1T05i?=
 =?utf-8?B?WjY3L3ArWkJSVjVyaDNxUExhNzNZUm1yK21KUU14bEhBZ0NXZENrNXYzelhX?=
 =?utf-8?B?UXBncDFRaVB5TnlzdXZCSFNMRW1KaFRwVkhtNGhNa0pmZElLRytRaEs0dWJM?=
 =?utf-8?B?ZG05Wks3U0Q5emxpZnMvZmhCSTgrdHpFSDhUV1dlcGg3NGFoN290NFdPK1A1?=
 =?utf-8?B?aTE2RUNCZk1lZEZRU2ZCeEdDWHQvSWs0b1BXTDREVk1SVXEvdnlaZzNhSXBC?=
 =?utf-8?B?dGk0WGNSU1RXU1hTQ1dpYktaRGhlWXRhVGhjaGZ1YWJRWDE4ZDFPS3dwRVAz?=
 =?utf-8?B?Wi9JV2dEcmlTOFo2YUZ5TWxLZWYxL3g0VlpuaDRxS3dndnpkRFJETi8zR3VI?=
 =?utf-8?B?K1hqTXB3TzNTNEpTaytvNmROSThDdWttYnlLNC83R3RraUJzK1UvdStoTFJn?=
 =?utf-8?B?V2JjcGRrRHBZTlNNclp5NFFraXdrUU9QbnJqcUlzb0Rub1A5Vk9MQ2hDM3d3?=
 =?utf-8?B?LzZNaC8rb1JDRHFQbTNEZjNMVUFoNWJsbC9DbWkxckZ1QnpKTEZwdUJQbXE1?=
 =?utf-8?B?aHRMVmlPVW9NNGJDRFF4Y2czL0xEZXVSSkJmZzJTNmV4cTFXakZXWGdvWEZV?=
 =?utf-8?B?czdEYlB4YldVYzRXR0NKVlZOZGVGd0c2Tkd4bTB3SVBGT3hKVHVTWkxuZDhw?=
 =?utf-8?B?emJZTDA4N2Y4cFJpYjNmTWNtY1BYdmtoTkxmS1BOT0JHRHJEeTJ1aDZleVVx?=
 =?utf-8?B?V29meERUcnZFVzd0Z3doWUhYSFhRSDN4d1JQZCsrTDhXTGgxOGZvOHN3QVZJ?=
 =?utf-8?B?NVh2S1ErajdXQlFsL2c3MVJVWExPQjRLVU8ySEZ6UHZjbEEydmZqa1lKSW5W?=
 =?utf-8?B?dHZsQUlTMExZT3dzekZ2M1F0ck1tTWt1eGxMbVowRklmUHBzSWhLcHd1cnMw?=
 =?utf-8?B?UUNCSStCbWFia3JBVlg1SWpIWmwzMVFtbTZRWlp5K3ppeTFYSTZTTUpwRXRy?=
 =?utf-8?B?R1BUckJKa1F0V1VmUlhSWnJ6UW9vTU45QUFwTkY2dHFldEVTZk0xSG5SNE40?=
 =?utf-8?B?eVM2bkVUTWRkR2d6Y2JtOUhqZW03R2ZJakU3bjBQTVhiS1R2Y0RCY3Nna0RW?=
 =?utf-8?B?enB0dGJhV0lsRVlnbG5TMFlINmlzdkpPNlVtbXgxYUtZcjFTbFA4aHVuY3lT?=
 =?utf-8?B?aHgrcVM0QmNHL0VrS3dYNWRTUkhWYXZRbjdvNTA3RUFwM29LcmUwSm5CZ3pD?=
 =?utf-8?Q?7t/Q6LW3+AVMiEFE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15825b9-195a-4cbf-f0d2-08df1425fd6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 19:09:10.7866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5bnFJU+DiFmoE6OogSq6rKFcV49NnquVHpPmT9PTfP2GKY7IA/XMPY6eMVgS4krdfhP1qP45Sfjk+4NM8bJEDWTEQ78swX60THrDjRG28mM/NlaCq2HGUbU90kZpTvO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16032

PiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0K
PiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAxNCwgMjAyNiAxMToyNSBQTQ0KPiANCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3Rl
bnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW0xvd10gQ29tbWl0IG1lc3NhZ2UgZGVz
Y3JpcHRpb24gaXMgbm90IGNhcGl0YWxpemVkLg0KPiAtLQ0KPiANCj4gY29tbWl0IDY3ZWU3NGZm
M2ZhZjRmM2MxOTY2MmI2MDQxYjEyZTkxZDU3N2NhYjkNCj4gQXV0aG9yOiBDb3NtaW4gVGFuaXNs
YXYgPGNvc21pbi1nYWJyaWVsLnRhbmlzbGF2LnhhQHJlbmVzYXMuY29tPg0KPiANCj4gbWZkOiBy
ei1tdHUzOiByZXVzZSBzaGFyZWRfcmVnX3VwZGF0ZV9iaXQoKSBpbiBzdGFydF9zdG9wX2NoKCkN
Cj4gDQo+IFRoaXMgY29tbWl0IHNpbXBsaWZpZXMgdGhlIGNoYW5uZWwgc3RhcnQgYW5kIHN0b3Ag
bG9naWMgYnkgcmV1c2luZyB0aGUNCj4gZXhpc3RpbmcgcnpfbXR1M19zaGFyZWRfcmVnX3VwZGF0
ZV9iaXQoKSBoZWxwZXIgaW5zdGVhZCBvZiBvcGVuLWNvZGluZyB0aGUNCj4gcmVhZC1tb2RpZnkt
d3JpdGUgcmVnaXN0ZXIgc2VxdWVuY2UuDQo+IA0KPiA+IG1mZDogcnotbXR1MzogcmV1c2Ugc2hh
cmVkX3JlZ191cGRhdGVfYml0KCkgaW4gc3RhcnRfc3RvcF9jaCgpDQo+IA0KPiBbU2V2ZXJpdHk6
IExvd10NCj4gVGhpcyBpc24ndCBhIGJ1ZywgYnV0IHRoZSBNRkQgc3Vic3lzdGVtIGZvcm1hdHRp
bmcgcnVsZXMgcmVxdWlyZSB0aGUNCj4gZGVzY3JpcHRpb24gZm9sbG93aW5nIHRoZSBwcmVmaXgg
dG8gYmUgY2FwaXRhbGl6ZWQuIFNob3VsZCAicmV1c2UiIGJlDQo+IGNoYW5nZWQgdG8gIlJldXNl
IiB0byBtYXRjaCB0aGUgc3Vic3lzdGVtIGNvbnZlbnRpb25zPw0KPiANCg0KQWNrLg0KDQo+IC0t
DQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MDkxNDIwMTQ1Ni4yMDE4NDAzLTEtY29zbWluLQ0KPiBnYWJyaWVsLnRhbmlzbGF2LnhhQHJl
bmVzYXMuY29tP3BhcnQ9Mg0K
