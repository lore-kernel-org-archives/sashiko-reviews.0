Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4AD387348
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765646; cv=fail; b=qwuEhExjNNsJiee8afHaIx+uil5np809F7f2eumhQXF9upm56QcdpjKZ+qiaVXHksN/2yhULVQQWJF9t927iohqD0eJXYvf0n/z4k5XzBRdTAmJrGTkzF75rPsPT54SITeMIkJhS0Xa6MIw5xQF09ey4AQuZMLH4C4gxbXw1BjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765646; c=relaxed/simple;
	bh=N7FNF3BEwTEU3iBYTicmZeT95wPzfOjpIVaOKOA91p8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FZvGXsfxnAd2cG4wyaAxBxHUczK1NPF+gVL9r8IQfW7aO2/mQ+WmmIJuwkNakmiviTasPqZxk/dSu3BnWA0nM/g13i5am/+nA9vsjewRzhxYEEA9Z1dqYFrhMaQm0JkplcMTmz/2r6P5Jzvr7RLK98i7x+E6G0vQRDom1xYH9/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ew4ri4EZ; arc=fail smtp.client-ip=52.101.56.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ew4ri4EZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFUeilmEbuYV59QplS2qiuHakPxpxoc3ipALkyy4termznxEuv1jLifaj4EvyBov7O4/oxLtkU7JQfCrGn7Oft6Xl5bV3NI1hMqZd+yhuBqnlrVsp4fWUOHfSXG8sShoS/hS1eXScdQogrCA4Z5pH1Bp/eBA/PYJz12s6AFTWA2mPFai4Zfig9BbKpR/VeHfHcUsziH5HCwqJKooKz474eUEuVF6wlGabzSn5mntMW2EQuKNlfxYxcj5r2E4vMlFmR9lP1UWJZ9Lq0/ar4SJ9h+FjsScRt8KHJTc6CjwyVxtFAf9PDqvRHHjGYVVz9VJG0U7B8ZlEys1apsfELVIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u889tsr15nfeos7Scn6iy/tbXksMrh8dF/cuS5Vsvj0=;
 b=gK49G5JFuvGw9ugGQtTOzHYJcYuVmCPy+86rawG6DdVAaaO1Qz7/APv6ejjRMqdRi4P7Saq44PgKSyOHoSNVUF6gPci9dzrbDk876KmGXXS3Lc0/FyvldJ31YVnWp09Qtm/Xt6iknfULjvhD5ve2zfsTacsT9QOkwNkw1NLjnhNaKyODx0WyEbOXp3QP+x+tfyKfVBiyL5ofxPbrf8L79+H5WUsrI+0n2gKwqjvT3KmDquCnf84QNWd0jElqnuBj4AvkO+hvrLkeMl1CZPEfXVjNR2Uf1JOv3DTvPbToF1mP0iIahlMb18QoKgJ9w8rzoCVlJzMaZD4vGLDwsa64hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u889tsr15nfeos7Scn6iy/tbXksMrh8dF/cuS5Vsvj0=;
 b=Ew4ri4EZ6NH8XXCFgSVuMY2MmvPASCqyo6LzJPHFRVYvbAybpKekMYY1YmKYbqvJuPIKusvfkQb9iBfSsCvX8SgOvSTvwb98SZMwdmIm1Y58AU+/NurC3tTog3Hi4r6Q29ys6IMXU/ZoOcN1WUF9HSHSMjMAIjlvYsr7VeOxleOehhoy+7wdXlfAgbXetn4/6MO8defzUjwcgex8wVg8DmlJUoa0qoTCwfnVp0EUE8/sxP6/k8OaRptYXzwuSdcz3u0BV0AG96C3+f/28ZzsVmPYDKUX+p+puatCXSxYdwD9NObUEgfK2Il5NLTV8PCWHhzCBrmKJaC+rLqBMyUftw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4314.namprd12.prod.outlook.com (2603:10b6:5:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 14:00:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0270.015; Mon, 3 Aug 2026
 14:00:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 23:00:35 +0900
Message-Id: <DKFD33JJD080.2N5VWK5MIMXR3@nvidia.com>
Cc: <sashiko-reviews@lists.linux.dev>, "Timur Tabi" <ttabi@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, <ojeda@kernel.org>
Subject: Re: [PATCH v7 2/8] rust: firmware: add request_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: <sashiko-bot@kernel.org>
References: <20260731201017.2580713-1-ttabi@nvidia.com>
 <20260731201017.2580713-3-ttabi@nvidia.com>
 <20260731202451.3A3381F00AC4@smtp.kernel.org>
In-Reply-To: <20260731202451.3A3381F00AC4@smtp.kernel.org>
X-ClientProxiedBy: OSTPR01CA0075.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f49336-72b4-432c-6f57-08def1679933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|56012099006|10067099003|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jJB32DL9L67nUVEB4ltUfEWC8hPQySQvUtxfLnZDPTQU+8oi2IpV628P06c2RoCoxkPOIq5GkCR/e/2Tb0sqjTxG391FI3fGP7wwo2OXaXLQTi0ovtOky52381JGsMy4Z1z5siXG8DZKDx8u2AHgJ3X0Hh/O99oupFFEnhFM6CJHNKcRgQVkhUP0blIVHbZc1wancsRJjGm4HXrseuHWGw7Wx+seucqGlxYAe3Qq4eUkTOPdW2adtTL3IS5MCfw2sp4X21WCZxKl1ghRjjAip/gAQtQt4bA9LN1u2dtZ6oFTde4WL1M+UGaoTDGvxLkY+kGDyyJO4KTBxYkOrw/jweXoT09awEoPuqEcPYmZvBow5Uo1nUBpawV2F++2MGdhAX0TmkN8+ZFZXR09cLbb4DOySCIfnVzTHO7vall3IzOaVI7rwManc+1ZVobq/kSYeOIe92/mVaJeizcoxoAC99mO34yNHPb24he6BHvg4JxgYLOwtEx/cnJBjtDc+430KpTWGEqSY8o5amKIM+VkaO+pm/ezx+tBX+r+9eeSb1mvsnJJXuxh8YdvVDtqM2bSJKK0DgwzKyY0Y/P2CPOE5XXWHyvgYLCOO7p1krHZnwZ56w3ER/2/W0/jjbI+hmDC3atu3Fmrn47xNa9rKlV7/M7gte+iH4ii+Lhcc24yaw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azVqQ3I2N0g3eitxbWo0NUZhT2xrS1FTeXM3ZWFTMnpubStMRTF3QzU0SmE4?=
 =?utf-8?B?SkMrZGdxaW5ENXJjSk1ScEVvR2dQMzUvUHpSTVRDQXJub3dabGVvMmFKQytX?=
 =?utf-8?B?QmJuSWxHZkR1OUNXaHBaYlZXN1QrTmJ6Yk1pNkZEdXNnemp1YlZIM3RhN2xM?=
 =?utf-8?B?Zzg2RDF4ampuc0lxWGEwS2h4MVFNK0RCd1AyTVNhQ1JocGo0QXJzTXlNRTF1?=
 =?utf-8?B?cHJjanF6eFJXMmdnaUwrUXA2bjBQdjVtNDc0RGFSdUV6OGxRNkxTKzQrcmtq?=
 =?utf-8?B?OFhBTC9pWUpOOW5JM0UrN3VSZE82SkxDSU1XMGtwZGZIby9jQlNEN3p5eGZl?=
 =?utf-8?B?dVhVVHlMa2JrUXF4K3AxVFg4VUZhYkt3TVdxTEFLNitFVnZ1QUQ0RVI4SFdt?=
 =?utf-8?B?Z29EVWpIV210czcyTzNDTFpxZHpNN1JuNGxCa0NmU0phdm9YaG1iS1lmRWRR?=
 =?utf-8?B?VmJWTXIwMmtucjZxQ0RFa205WHQrTGhDNUcrQTF3b2w0N21zV05VYlptZnp1?=
 =?utf-8?B?QkNpK0JYRUxKWXc4THNmTmY2MXhWdTNDNFVabCs4ZVNBcEZBbmlZdWE4Q3Iz?=
 =?utf-8?B?S2FKZHVWRnp6TWFkQU5yeGJ3STRYamdQaTkvT21FMlNWZXhyMW9XUExGbnRl?=
 =?utf-8?B?Vm1ZcDhyRGxiZUFWdWZWT1JkZTNpUmNGUHg3OEFzT2lxUkNpODF4YURtOWUy?=
 =?utf-8?B?TExiZmdMSVY1VFBuUzlkRXJaNUVjam1YTEtYM3NacDdmeHpRUXh3bXBRMG5z?=
 =?utf-8?B?OTN2SmNKTXc5VWhJUHZoY2cxQ3d3WDQwaU9WQVZ0R3MvZE41dEhNWFd3MTdr?=
 =?utf-8?B?NXV1cFFUWi8vVHZ4WVExNGcyeURTbDgrYlA0SkVoaEhFYTZhQ2R5MUxwdVNW?=
 =?utf-8?B?MGJuTVZMV2poNUNtMXgrRGtDejVRck40ZmErcWZIMHNJcjlxakhLVGJtbVBF?=
 =?utf-8?B?eFhDbEJsNTZ5TkZHWlkxN2tkY3c0MitCS0ZPaWhuMmdXczVzVXhOK2k2eXpq?=
 =?utf-8?B?aWxoUVp6NmVrZE5KL3I3ditYWGNUQVc2cC9TTG04KzNNU3FJRm1kL2pHV0dp?=
 =?utf-8?B?V20wbVZYVXh0cFVKR25hRjdVZEJHaDFkN0hEWXpMTGtiemxOemdLdWQwSjJj?=
 =?utf-8?B?MlZQZG9qTlN6U3ZxK3J5SnIxMzBEODBuWmU1NCsrY3h0K1I5anVPc1R6K3k4?=
 =?utf-8?B?a3RKY3hVUTZ0VGpEYWNsRFY5azdmY0dVSDJjd0pQdDhEeWJMUm9saWYvUUx4?=
 =?utf-8?B?dm8rY2JHdnVRWDRXRkFUNlhLU2ZUSmM5SWNjcUhnRU9DMkhDWXN3djE2WGxt?=
 =?utf-8?B?eDhiNGdMZUZudFlJV1lhb2pVcHM1MFNSUXlid2Nha2lLUlVTYzRBdTk1QTBs?=
 =?utf-8?B?ZFRyWnRHNDJmekw3WjFQWVdEeUg3TVZLaFhwTXVaYnZFQ21PQlRFUThYd2pw?=
 =?utf-8?B?dXVBSThkbzFwYVRnZEl0ditoTC9HNlBxNko3ZWNyMjJtSG1rTGJNcE1mQ1B6?=
 =?utf-8?B?U1FJeEdsaWVzbXRCbUo5bDdzS2UwcXFqNC9IUlQ4VGM3QkxIT21ncXZTaEV6?=
 =?utf-8?B?QXNkamJ5c2FNSHpSSXB2ZFhOZ3pyOS92TEk3bS9JQXBsS1JPT0JhSVJlWGFx?=
 =?utf-8?B?aWRSbzRJbDJlYVhiN2xKSUc2N01ETFRham9CT0dIZW9ZcTFNa1JoWWxLdmRh?=
 =?utf-8?B?T0hwVnhwYWJUTE50UngzbG5BdmF2L1QyYXMwY0k3Z09ya2xLcUg1SVZiQmM2?=
 =?utf-8?B?dm92S2NhaEUrZUhtOE94c3pBS2IvMHZzYXVCdUhrdGsvblZRZzR3bldhNnZ6?=
 =?utf-8?B?cE9PY2FrSjlwY1BtUFRzT0JwUXlUVEszeXBTS1ArK01uZ1RoRWNRUm1Nazgw?=
 =?utf-8?B?ajVuSHhWL2k0VmQzTVVoaWdROFAwZ3dFYXJ1eU5WRmlDY01VTHhublpsdnlk?=
 =?utf-8?B?TWdyVHNVWHRpblU1a20zQ0xHdFBhNlpPVm5rRk9nemp4N0ZBd0xWN1VOWEtW?=
 =?utf-8?B?WXYzNXh6K2lmWFc3OHYvckpsWUp2aU5Oa1VrNDA2dnZiZWtrSDZTK0htY1Mz?=
 =?utf-8?B?eVAvM1Z5eHU0TzNLM09uYXYyVzVpSTVYT3ZjUXZiR2RINmpidE92bjhqR2E1?=
 =?utf-8?B?QWRIbmlVeU02TkVtbnhHNmt0SGNoeW9SdFF5RGthbFlWVzBvbzBQQzM4ek9u?=
 =?utf-8?B?ZkZCWm1Ka3J1WTRSL1FxM3gyRW02Z3lJRk5CQ2oyNE5tUzBpUmhkZjFTTlIz?=
 =?utf-8?B?WXgzT3VvSFV4R0ZVd2ZVbkt2WXBYSCtaL3UvSG9IbnBNc3MyNlBtdC81L3R0?=
 =?utf-8?B?TTZ0eEEvZGppb3kxd3ZjeTFsZkIzSmh5TlZQb3dtUElIY1huVE1KR0lUT3Vr?=
 =?utf-8?Q?uBayFC2Pj/rr2gRARjUQfXb1cCg5WDOuC5ysXqhuWnVBd?=
X-MS-Exchange-AntiSpam-MessageData-1: B17F4jZTcBwozQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f49336-72b4-432c-6f57-08def1679933
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:00:38.9317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JF85jarFklhUJ4fL6TeRfyEidOZHVodVQ+oMTN0OFIIV8ab857Zd+xK+MbEUyCLRDO7XeUeXW0z5o6QjmNgduQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4314

On Sat Aug 1, 2026 at 5:24 AM JST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] `request_into_buf` discards the actual size of the loaded firmwa=
re, exposing the caller to trailing uninitialized or stale data.
> - [Low] The wrapper unnecessarily casts a mutable pointer to a const poin=
ter, which is unidiomatic and confusing.
> --
>
> --- Patch [2]: [PATCH v7 2/8] rust: firmware: add request_into_buf() ---
> commit e3d518ea065bd3aeb4a38939d026df9eef8651b7
> Author: Timur Tabi <ttabi@nvidia.com>
>
> rust: firmware: add request_into_buf()
>
> Add request_into_buf(), a Rust wrapper around the request_firmware_into_b=
uf()
> function. This variant loads the firmware image directly into a caller-pr=
ovided
> buffer rather than a kernel-allocated one.
>
>> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
>> index 1e3dd2e3422db..deb119d4813c0 100644
>> --- a/rust/kernel/firmware.rs
>> +++ b/rust/kernel/firmware.rs
>
> [ ... ]
>
>> @@ -116,6 +116,50 @@ fn drop(&mut self) {
>>      }
>>  }
>> =20
>> +/// Load firmware directly into the caller-provided `buf`.
>> +///
>> +/// On success the firmware image has been copied into `buf`; the calle=
r accesses the data
>> +/// through `buf` itself.
>> +///
>> +/// This is intentionally a stand-alone function rather than a `Firmwar=
e` constructor. For
>> +/// the `into_buf` path, the firmware data lives in the caller's `buf`,=
 not in a
>> +/// kernel-owned buffer, so returning a `Firmware` would expose `Firmwa=
re::data()` as a
>> +/// second handle aliasing `buf` (and `release_firmware()` does not fre=
e `buf` anyway).
>> +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> R=
esult {
>
> [ ... ]
>
>> +    let mut fw: *mut bindings::firmware =3D core::ptr::null_mut();
>> +    let pfw: *mut *mut bindings::firmware =3D &mut fw;
>> +    let pfw: *mut *const bindings::firmware =3D pfw.cast();
>
> [Severity: Low]
> This isn't a bug, but is it necessary to declare a mutable pointer and th=
en
> cast it to a pointer-to-const?=20
>
> The FFI function expects a *mut *const bindings::firmware. Declaring
> let mut fw: *const bindings::firmware =3D core::ptr::null(); would produc=
e
> the correct *mut *const address naturally, without requiring these casts.

Sashiko is correct here, this can be simplified as follows (on apply if
no respin is required?):

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 5b336bd1f09c..bf759c4f8996 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -139,16 +139,14 @@ pub fn request_into_buf(name: &CStr, dev: &Device, bu=
f: &mut [u8]) -> Result {
         return Err(EINVAL);
     }

-    let mut fw: *mut bindings::firmware =3D core::ptr::null_mut();
-    let pfw: *mut *mut bindings::firmware =3D &mut fw;
-    let pfw: *mut *const bindings::firmware =3D pfw.cast();
+    let mut fw: *const bindings::firmware =3D core::ptr::null();

-    // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::f=
irmware` pointer.
+    // SAFETY: `&mut fw` is a valid pointer to a NULL initialized `binding=
s::firmware` pointer.
     // `name` and `dev` are valid as by their type invariants. `buf` is a =
valid writable
     // buffer of `buf.len()` bytes.
     to_result(unsafe {
         bindings::request_firmware_into_buf(
-            pfw,
+            &mut fw,
             name.as_char_ptr(),
             dev.as_raw(),
             buf.as_mut_ptr().cast(),
