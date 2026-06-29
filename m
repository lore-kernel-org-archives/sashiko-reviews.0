Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DD13D0938
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718094; cv=none; b=tide6eWke+1NrVRw77I9z6wItvNSKdrkD5haOsnOTE8LuhcTT6Qn4hKi3Qy2jJrXA/i0QRuWv3hTst+fujgMQYyXwWrP2CT56lapPjwp+xcAHpohfOMiRBpHGRDmHTjeNCjdNGdz8wHc9cfdA2ta6nEb05Zm7lAbojCupNE294g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718094; c=relaxed/simple;
	bh=OcdmFsnHzMp6D/Qvg2QuMHnd1rJZiI2X9MXu8z062B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b04c7LX/Dne0HorSUOr/iMHZ4wkFUJbLixS9GNY5zdtoHlVO76prsbvNpTebw3hSz8TGBVydvm2LHt/QmUNnR5PFyD+6uou3Ejz4PH1xP6ncnz09THDUXtAWKaC7ZcHyhMJtScYIoBPbW+cKIZdksXG+l/bqN995bvxvU+WBWTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CiIx2oY5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CiIx2oY5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4938d60c035so13524455e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 00:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782718088; x=1783322888; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OcdmFsnHzMp6D/Qvg2QuMHnd1rJZiI2X9MXu8z062B0=;
        b=CiIx2oY5h8P2sLhMtj1oPufMqkeA/0JasDZ6LN0mpmx1RDPp2aimIbXPgrS23inDNI
         bxXWLbo4St0SmsROBykTOWtGUZUmqgbjIS5uQMAlHW/sOTv0Ryl9idZuiZN8GG56I7UM
         orZx+QTmgsvtGEUS9vE2pCzRYEDw9R3wAcTPPPNuJWToxko+okLqM5LM7tJYpsd2ogwA
         of/KKxwUfVBSDIfHocbT+2ZDVubQqb5KTeHBL1woz7d9eTEa+4a7EYXVfxRd0lVlSu8q
         03ToZniQmNkLi602Kz7aDsO1RRGsOzpAZL/5sMtD0zqLEgTw4nfXKCSrITDrxnZY28V7
         34cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718088; x=1783322888;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcdmFsnHzMp6D/Qvg2QuMHnd1rJZiI2X9MXu8z062B0=;
        b=DrY6+UnDaaT0YYcjUtC8llD4TSDcfe1Dw5N74Ke3vpHfE5ujyY+ocy7ytUniO+jDzr
         1usfASZ967Dw9Vuj9tTlGiu1FH6pJ8sKlgchLYiCDTp7TIW8qCJohe3rrGTdL5Ub+BaV
         yCxJvn+u5AX+cisFW63AZGm/kcKy709K3zYHYjMzS0573B3E84/mxmzMwph0HsLVUGQm
         2BW6w+EnMRi9R6UXxhtYT0wVsz9BqZJSiCbQIjvhJewaX31uMISN5NioXSm5SyDF4PRm
         PEd1xp6LMu+uiVTFrdhIW2QPt5Wdtx+E9DcQO54txbdEMCUDZrSZORKFFqn9wsKTy70R
         vfBA==
X-Gm-Message-State: AOJu0Yydm7vhVovOZgKryiYyurRpJqfOjvLxGZO4Bf8847RTV0W8k8hJ
	lNYovbHJd2OgkaOTDE/7O3z97akpk0gHBMnuOT3B4f+fkoVypq7stB4p4bCZx4KFpkGamLx5vFt
	Sr0Ec6VgHUA==
X-Gm-Gg: AfdE7ckZWQXliIvAgMbdNNrEeEGfumQrv3QQHVvwUFRVJ8H72791LEwlDyZt0cFvQWi
	sCK32uNgfWZTBHMqOInnOvXTJ8tSI2MF1L1MqpxrvTxqCVus6OAZ6aAhHHA6Wi+zeSeQ5NzCHVz
	B6NAOOUT3Anz0xNKV+bIm1yv7DQ78rO5Xrhf+d/B/pc9NghOLod3NC8rYRJ0k2ULQRaVIzJ6N+8
	GmiQ2NG4I1res13MuyTM6NBuXLGio/7DlQLO4yw1Wk117UMkl+JZmdQ16ptH0Q5BhyxEt7oAvMi
	ZDxMGey/ISj0SQiWH5n0DdSQSo66sb1gCiJVUkLm0VivfB28chk65TAqjs+0oA52bILhust3W6R
	7rnQYzo5wwSBxrA01uvIe5qozXpBxgVaDIwgTbATU06oPR0SqK0Bfk6EMkrjGIiccito8lkBE+G
	lRXAH2+Fzc/neMEU4Lnbzc43IBgI7/IMibKxSP5FiDgJ5USEu/neKxSncLFNBk/AAOuxLSthSSS
	O8c+kzaBahIrM23CvYCLPw8jaQMm2mAeaKDe0/adSQ=
X-Received: by 2002:a05:600c:a49:b0:490:bbc4:76a6 with SMTP id 5b1f17b1804b1-49266880f91mr221309295e9.21.1782718087532;
        Mon, 29 Jun 2026 00:28:07 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a55be64esm142443335e9.7.2026.06.29.00.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:28:07 -0700 (PDT)
Message-ID: <9a55d4e7-23d2-4a1e-9ae9-ab60104cc9e1@suse.com>
Date: Mon, 29 Jun 2026 09:28:06 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/32] drivers/ata: Stop using 32-bit MSR interfaces
To: sashiko-reviews@lists.linux.dev
Cc: linux-ide@vger.kernel.org, dlemoal@kernel.org, cassel@kernel.org
References: <20260629060526.3638272-1-jgross@suse.com>
 <20260629060526.3638272-21-jgross@suse.com>
 <20260629062359.61A821F000E9@smtp.kernel.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20260629062359.61A821F000E9@smtp.kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kdqywjck4KHGyuvFa4d0h7vX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kdqywjck4KHGyuvFa4d0h7vX
Content-Type: multipart/mixed; boundary="------------EcbcQ3J4jFasbQpBGnHGgLKV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-ide@vger.kernel.org, dlemoal@kernel.org, cassel@kernel.org
Message-ID: <9a55d4e7-23d2-4a1e-9ae9-ab60104cc9e1@suse.com>
Subject: Re: [PATCH 20/32] drivers/ata: Stop using 32-bit MSR interfaces
References: <20260629060526.3638272-1-jgross@suse.com>
 <20260629060526.3638272-21-jgross@suse.com>
 <20260629062359.61A821F000E9@smtp.kernel.org>
In-Reply-To: <20260629062359.61A821F000E9@smtp.kernel.org>

--------------EcbcQ3J4jFasbQpBGnHGgLKV
Content-Type: multipart/mixed; boundary="------------001niJwcZkdHnL16ZJ1KF430"

--------------001niJwcZkdHnL16ZJ1KF430
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDYuMjYgMDg6MjMsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRo
YW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtDcml0aWNhbF0gVGhl
IGNoYW5nZSB0byBgd3Jtc3JxKClgIGluIGBjczU1MzVfc2V0X3Bpb21vZGVgIGludHJvZHVj
ZXMgYSBjcml0aWNhbCBzaWduLWV4dGVuc2lvbiBidWcsIHdyaXRpbmcgYDB4RkZGRkZGRkZg
IHRvIHRoZSB1cHBlciAzMiBiaXRzIG9mIHRoZSBNU1IuDQo+IC0gW0xvd10gVGhlIGNvbW1p
dCBtZXNzYWdlIGlzIGluY29tcGxldGUgYW5kIHRydW5jYXRlZCBtaWQtc2VudGVuY2UuDQo+
IC0tDQo+IA0KPiBjb21taXQgOWE0YzY4MjFiNGVmNjAzMTZlYzJiMzZlMGY1MDVmNDE0ODgw
OTk2Ng0KPiBBdXRob3I6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+
IGRyaXZlcnMvYXRhOiBTdG9wIHVzaW5nIDMyLWJpdCBNU1IgaW50ZXJmYWNlcw0KPiANCj4g
VGhlIDMyLWJpdCBNU1IgaW50ZXJmYWNlcyByZG1zcigpIGFuZCB3cm1zcigpIGFyZSBwbGFu
bmVkIHRvIGJlIHJlbW92ZWQuDQo+IFRoaXMgcGF0Y2ggc3dpdGNoZXMgdGhlIHBhdGFfY3M1
NTM1IGFuZCBwYXRhX2NzNTUzNiBkcml2ZXJzIHRvIHVzZSB0aGUNCj4gNjQtYml0IHZhcmlh
bnRzIGluc3RlYWQuDQo+IA0KPj4gICAgICBJbiBkcml2ZXJzL2F0YS9wYXRhX2NzNTUzNi5j
IGRvbid0IHJlZGVmaW5lIHJkbXNyKCkgYW5kIHdybXNyKCkgYXMNCj4+ICAgICAgZW1wdHkg
bWFjcm9zIGZvciBhdm9pZGluZyBtaXN1c2UsIGJ1dCBndWFyZCB0aGUgYWZmZWN0ZWQgY29k
ZSB2aWENCj4gDQo+IFtTZXZlcml0eTogTG93XQ0KPiBUaGlzIGlzbid0IGEgYnVnLCBidXQg
dGhlIGNvbW1pdCBtZXNzYWdlIGFwcGVhcnMgdG8gYmUgdHJ1bmNhdGVkIG1pZC1zZW50ZW5j
ZS4NCg0KT2gsIHNvcnJ5LCB3aWxsIHVwZGF0ZS4NCg0KPiANCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2F0YS9wYXRhX2NzNTUzNS5jIGIvZHJpdmVycy9hdGEvcGF0YV9jczU1MzUuYw0K
Pj4gaW5kZXggZDc5M2ZjNDQxYjQ2Ny4uZGE5ODM5MGNjNDllOCAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvYXRhL3BhdGFfY3M1NTM1LmMNCj4+ICsrKyBiL2RyaXZlcnMvYXRhL3BhdGFf
Y3M1NTM1LmMNCj4+IEBAIC0xMDIsMTYgKzEwMiwxNiBAQCBzdGF0aWMgdm9pZCBjczU1MzVf
c2V0X3Bpb21vZGUoc3RydWN0IGF0YV9wb3J0ICphcCwgc3RydWN0IGF0YV9kZXZpY2UgKmFk
ZXYpDQo+PiAgIAkJY21kbW9kZSA9IG1pbihtb2RlLCBwYWlybW9kZSk7DQo+PiAgIAkJLyog
V3JpdGUgdGhlIG90aGVyIGRyaXZlIHRpbWluZyByZWdpc3RlciBpZiBpdCBjaGFuZ2VkICov
DQo+PiAgIAkJaWYgKGNtZG1vZGUgPCBwYWlybW9kZSkNCj4+IC0JCQl3cm1zcihBVEFDX0NI
MEQwX1BJTyArIDIgKiBwYWlyLT5kZXZubywNCj4+IC0JCQkJcGlvX2NtZF90aW1pbmdzW2Nt
ZG1vZGVdIDw8IDE2IHwgcGlvX3RpbWluZ3NbcGFpcm1vZGVdLCAwKTsNCj4+ICsJCQl3cm1z
cnEoQVRBQ19DSDBEMF9QSU8gKyAyICogcGFpci0+ZGV2bm8sDQo+PiArCQkJCXBpb19jbWRf
dGltaW5nc1tjbWRtb2RlXSA8PCAxNiB8IHBpb190aW1pbmdzW3BhaXJtb2RlXSk7DQo+PiAg
IAl9DQo+PiAgIAkvKiBXcml0ZSB0aGUgZHJpdmUgdGltaW5nIHJlZ2lzdGVyICovDQo+PiAt
CXdybXNyKEFUQUNfQ0gwRDBfUElPICsgMiAqIGFkZXYtPmRldm5vLA0KPj4gLQkJcGlvX2Nt
ZF90aW1pbmdzW2NtZG1vZGVdIDw8IDE2IHwgcGlvX3RpbWluZ3NbbW9kZV0sIDApOw0KPj4g
Kwl3cm1zcnEoQVRBQ19DSDBEMF9QSU8gKyAyICogYWRldi0+ZGV2bm8sDQo+PiArCQlwaW9f
Y21kX3RpbWluZ3NbY21kbW9kZV0gPDwgMTYgfCBwaW9fdGltaW5nc1ttb2RlXSk7DQo+IA0K
PiBbU2V2ZXJpdHk6IENyaXRpY2FsXQ0KPiBXaWxsIHRoZXNlIHdybXNycSgpIGNhbGxzIHdy
aXRlIDB4RkZGRkZGRkYgaW50byB0aGUgdXBwZXIgMzIgYml0cyBvZiB0aGUNCj4gTVNSIGZv
ciBQSU8gbW9kZSAwPw0KPiANCj4gQmVjYXVzZSBwaW9fY21kX3RpbWluZ3MgY29udGFpbnMg
dTE2IHZhbHVlcywgQyBpbnRlZ2VyIHByb21vdGlvbiBydWxlcyB3aWxsDQo+IHByb21vdGUg
cGlvX2NtZF90aW1pbmdzW2NtZG1vZGVdIHRvIGEgc2lnbmVkIDMyLWJpdCBpbnQgYmVmb3Jl
IHRoZSBzaGlmdC4NCj4gDQo+IEZvciBQSU8gbW9kZSAwICgweEY3RjQpLCB0aGUgc2hpZnQg
cmVzdWx0cyBpbiBhIG5lZ2F0aXZlIDMyLWJpdCBpbnRlZ2VyDQo+ICgweEY3RjQwMDAwKS4N
Cj4gDQo+IFNpbmNlIHdybXNycSgpIHRha2VzIGEgdTY0IHBhcmFtZXRlciwgdGhpcyBuZWdh
dGl2ZSAzMi1iaXQgaW50IGlzIGltcGxpY2l0bHkNCj4gc2lnbi1leHRlbmRlZCB0byA2NCBi
aXRzICgweEZGRkZGRkZGRjdGNFhYWFgpLiBUaGlzIGNvcnJ1cHRzIHRoZSB1cHBlcg0KPiAz
MiBiaXRzIG9mIHRoZSB0aW1pbmcgcmVnaXN0ZXJzLCB3aGljaCBjb3VsZCB0cmlnZ2VyIGEg
R2VuZXJhbCBQcm90ZWN0aW9uDQo+IEZhdWx0Lg0KPiANCg0KUmlnaHQsIHdpbGwgZml4IHRo
YXQuDQoNCg0KSnVlcmdlbg0K
--------------001niJwcZkdHnL16ZJ1KF430
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------001niJwcZkdHnL16ZJ1KF430--

--------------EcbcQ3J4jFasbQpBGnHGgLKV--

--------------kdqywjck4KHGyuvFa4d0h7vX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpCHoYFAwAAAAAACgkQsN6d1ii/Ey/S
4Af/ZwIYVSHNkMbmRAU/BB2a2/9P5rrE0I8HMltSOd2e01EJNhHiufVvboTkXqB68iKnY8rAJkst
DGHGyE1NSzHCymTuyX58ASRBIPVVLZKceGXCPgOcqhVyXxmPDs4vw//++fsV+6Krod9CFQ4FGz2w
ZoOvJHpXJNxhnBMUHMxw+A3hY5nPw1rruVnD30a6WaQVxhu9XYhqZYVPtWS30VtBY81nJ28qeWaX
95hRtUnNy7B1MAARzIWukseHfWX2MkyquFTvMlmNFJlG38cVlXGaQPnNSK9LtLxYpFuZijhlhn0s
0mmGbDUMHwN+GhEH4SMVOgR8CcjmjVxCearZT8GElQ==
=qAbt
-----END PGP SIGNATURE-----

--------------kdqywjck4KHGyuvFa4d0h7vX--
