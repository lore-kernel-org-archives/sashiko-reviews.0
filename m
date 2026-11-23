Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.107.87.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458145;
	b=KZE7cIhBctD0Pa32c1Lj0U+2dnXsA6yfTVKDrMfUvHOxQBLNPyxt2anFd3u+jMPZ/GMN
	 0KJ2obhNLYKVSIRlPN0d/f1Dx2sueMlD1EhPryvjXsXojneSiv/BfN4NSCFz/R5G7Zw2V
	 KNyLSH5ow6ZlqIJsY1tH2li1mVrsVwImJJkfHj5XQ08sBQsBRzPav1w4UsT4mfBaHKH5/
	 6s50EGFlKIe+i75qUb0fhtt78zB4Z61v4dpR0y2hZjDUZNR3fXNwXSVx7HM5smB+bKkgq
	 xYYoaoEKjWLG1lCmfqJ2nDCpz8VKrkTuU5z7zvzFRTpZqtjLEnyLzZW3mb+B+sKss4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458145;
	h=DMARC-Filter:Received:Received:Received:Received:DKIM-Filter:
	 DKIM-Signature:X-Virus-Scanned:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type;
	bh=Tl07VgYRYPrd4yO1dawitexfAc66nYUANVpPfP2Bgdg=;
	b=qJhSIPuzOAf9SVuEoX7nHWETGimgiLuhK8ynKEnKCJr6TUZ0wdwY2kdx1TCo4emVnB2K
	 8fI9RPvnEWdFL1JwoUuvGCUfLT0d+wFo12oJB6asAB1WPoUgrGMd3n3UoDOttr6qVeATp
	 TAv2g5Y3gdxCVQMT47M1c6eU30HmvSn73xSNcQzd53GVUfW7G8MVnyt1zd/67/fbAuKmP
	 E3Ui7YSmd1RotqQvWTNtc3j2+cvutAcic9vMSPs80CqFyg9TjG//muKWsNXX5FstG/moT
	 qdvd3le41CXp3iS4tvHfVpdaTpk80YgIrHtrBCsaadLJrhXPGH9ex/64Yd/JhcKVQeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tngtech.com;
	spf=pass smtp.mailfrom=tngtech.com;
	dkim=pass header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=cRYR4i1Z;
	arc=none smtp.remote-ip=34.107.87.41
Received: from mailout.tng.vnc.biz (mailout.tng.vnc.biz [34.107.87.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79372606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 18:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79372606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tngtech.com header.i=@tngtech.com header.a=rsa-sha256 header.s=B14491C6-869D-11EB-BB6C-8DD33D883B31 header.b=cRYR4i1Z
Received: from zmproxy.tng.vnc.biz (zmproxy.tng.vnc.biz [172.16.1.23])
	by mailout.tng.vnc.biz (Postfix) with ESMTPS id 3DC8A3FCB9;
	Mon, 23 Nov 2026 19:22:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 1615B1F967A;
	Mon, 23 Nov 2026 19:22:17 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 2RRZBMaxpMnu; Mon, 23 Nov 2026 19:22:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 5CA7B1FB967;
	Mon, 23 Nov 2026 19:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 5CA7B1FB967
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1795458136;
	bh=Tl07VgYRYPrd4yO1dawitexfAc66nYUANVpPfP2Bgdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cRYR4i1ZGDcuyOWY3XWi9FyM2U7D7bi3Xb1RcL3ehbjW8IKn2qc5h3rtrD+vG9vNK
	 dvAu9WXZ7CgkVsqanrBdePL9sRfoNFswhBHCuTz5N0MNESzekqN/PZ1s8sGAOtTE88
	 tAJBdOJVRfL1U3ynBTWvFdBf8JfJoscksnaIoBYD/BLWQ/U2YuX63OXp8Y/sIJsVBY
	 ofVw7ZE8jr8gp/EOj6QoH5VTNxT28xokgZu6g1gavonmNx6pD5pDmI6iTZwmMt9Cxc
	 r1+ywsbXQiQZoPyJAObYOV6Ih3WUQYnisAkEFAYaIlzHu55M/dXUMh77g8fdWogGEp
	 9QaEU3+lUrBww==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ZyW3-1g3VR-S; Mon, 23 Nov 2026 19:22:16 +0100 (CET)
Received: from [192.168.0.168] (ipservice-092-209-236-032.092.209.pools.vodafone-ip.de [92.209.236.32])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id A979E1F967A;
	Mon, 23 Nov 2026 19:22:15 +0100 (CET)
Message-ID: <758f4cfe-455d-43ee-b7d1-a5b297c27b45@tngtech.com>
Date: Mon, 23 Nov 2026 19:22:14 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] kbuild: record cmd-prereqs in .cmd files
To: sashiko-reviews@lists.linux.dev, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
References: <20261119204457.9968-1-luis.augenstein@tngtech.com>
 <20261119204457.9968-5-luis.augenstein@tngtech.com>
 <sashiko-outbox-226092@kernel.org>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <sashiko-outbox-226092@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------l7Tb4UlcFDzsW9lLNuQAqkCa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------l7Tb4UlcFDzsW9lLNuQAqkCa
Content-Type: multipart/mixed; boundary="------------DUzfuSXrsFsSLRnbD24UkJTl";
 protected-headers="v1"; hp="clear"
Message-ID: <758f4cfe-455d-43ee-b7d1-a5b297c27b45@tngtech.com>
Date: Mon, 23 Nov 2026 19:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] kbuild: record cmd-prereqs in .cmd files
To: sashiko-reviews@lists.linux.dev, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 maximilian.huber@tngtech.com
References: <20261119204457.9968-1-luis.augenstein@tngtech.com>
 <20261119204457.9968-5-luis.augenstein@tngtech.com>
 <sashiko-outbox-226092@kernel.org>
Content-Language: en-US
From: Luis Augenstein <luis.augenstein@tngtech.com>
In-Reply-To: <sashiko-outbox-226092@kernel.org>

--------------DUzfuSXrsFsSLRnbD24UkJTl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMjAvMjYgMjE6NDUsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFtT
ZXZlcml0eTogTG93XQ0KPiBTaG91bGQgcHJpbnRfbWFrZV9wcmVyZXFzKCkgc3RyaXAgYSBs
ZWFkaW5nICIuLyIgZnJvbSBkZXAtPm5hbWUgYmVmb3JlDQo+IGluc2VydGluZyBpdCBpbnRv
IHNlZW5fcHJlcmVxc19oYXNodGFiPw0KPiANCj4gTWFrZSBzdHJpcHMgbGVhZGluZyAiLi8i
IGZyb20gcHJlcmVxdWlzaXRlcyBpbiAkKHJlYWwtcHJlcmVxcyksIHdoZXJlYXMNCj4gY29t
cGlsZXIgZGVwZmlsZXMgcmVjb3JkIHBhdGhzIHVuZGVyIC1JLi9pbmNsdWRlIChhbmQgc2lt
aWxhciBmbGFncyB1c2luZw0KPiAkKG9ianRyZWUpIG9yICQoc3JjdHJlZSkgd2hlbiBzZXQg
dG8gIi4iKSB3aXRoIGEgbGVhZGluZyAiLi8iLiAgT24gYSBjbGVhbg0KPiBidWlsZCwgdGhv
c2UgZGVwLT5uYW1lIGVudHJpZXMgd2lsbCBub3QgbWF0Y2ggdGhlIHRva2VucyBpbiBwcmVy
ZXFzIGFuZA0KPiB3aWxsIGJlIHJlY29yZGVkIGluIGJvdGggbWFrZV9wcmVyZXFzXzx0YXJn
ZXQ+IGFuZCBkZXBzXzx0YXJnZXQ+LCB3aGlsZSBhbg0KPiBpbmNyZW1lbnRhbCBidWlsZCBm
aWx0ZXJzIHRoZW0gb3V0IHZpYSAkKHBhdHN1YnN0IC4vJSwlLCQoZGVwc18kQCkpIGluDQo+
IGNtZC1wcmVyZXFzLg0KDQpUaGlzIGlzIG5vdCBhbiBpc3N1ZS4NCg0KRGVwZmlsZXMgY29u
c3VtZWQgYnkgZml4ZGVwIGRvIG5vdCBjb250YWluIGEgIi4vIi1wcmVmaXguDQpUaGUgb25s
eSBvYnNlcnZlZCAiLi8iLXByZWZpeGVkIGRlcHMgYXJlIGluDQprZXJuZWwvLmtoZWFkZXJz
X2RhdGEudGFyLnh6LmNtZC4gVGhhdCBmaWxlIGlzIGdlbmVyYXRlZCBieQ0KY21kX2FuZF9z
YXZlY21kLCB3aXRoIGl0cyBkZXBmaWxlIGFwcGVuZGVkIGFmdGVyd2FyZCBieSBhIGN1c3Rv
bSBydWxlLg0KSXQgZG9lcyBub3QgdXNlIGZpeGRlcC4gU28gdGhpcyBkb2VzIG5vdCBqdXN0
aWZ5IGNoYW5naW5nIGZpeGRlcC4NCg0KY21kLXByZXJlcXMgb25seSBzdHJpcHMgbGVhZGlu
ZyAiLi8iIHNvIHRoYXQgaW5jcmVtZW50YWwgYnVpbGRzDQpmaWx0ZXIgdGhlIGFwcGVuZGVk
IGRlcHNfIG91dCBvZiBtYWtlX3ByZXJlcXNfLiBXaXRob3V0IGl0LA0KY21kX2FuZF9zYXZl
Y21kIHdvdWxkIGR1cGxpY2F0ZSB0aG9zZSBwYXRocyBhbmQgYnJlYWsgdGhlIGJ1aWxkDQph
cyBkZXNjcmliZWQgaW4gbXkgdjUgcmVzcG9uc2UuDQoNCi0tIA0KTHVpcyBBdWdlbnN0ZWlu
ICogbHVpcy5hdWdlbnN0ZWluQHRuZ3RlY2guY29tICogKzQ5MTUyMjUyNzU3NjENClRORyBU
ZWNobm9sb2d5IENvbnN1bHRpbmcgR21iSCwgQmV0YS1TdHIuIDEzLCA4NTc3NCBVbnRlcmbD
tmhyaW5nDQpHZXNjaMOkZnRzZsO8aHJlcjogRHIuIFJvYmVydCBEYWhsa2UsIFRob21hcyBF
bmRyZXMsIE1vcml0eiBQcmlueg0KQXVmc2ljaHRzcmF0c3ZvcnNpdHplbmRlcjogSGVucmlr
IEtsYWdnZXMNClNpdHo6IFVudGVyZsO2aHJpbmcgKiBSZWdpc3RlcmdlcmljaHQ6IEFtdHNn
ZXJpY2h0IE3DvG5jaGVuICogDQpIYW5kZWxzcmVnaXN0ZXJudW1tZXI6IEhSQiAxMzUwODIN
Cg0K

--------------DUzfuSXrsFsSLRnbD24UkJTl--

--------------l7Tb4UlcFDzsW9lLNuQAqkCa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJzBrWn4qHw5a0jAXeVyKys3c+zQFAmsEhFcFAwAAAAAACgkQeVyKys3c+zTz
xRAAi4b7ELGarK50t/FcBpnLkS+E6MnB+aFxznUo1YnL2xEDRkL2vxsxH2sl7OJ3aaNFYicG4JbL
g5OCyB1HzEMhXsws6B6d27K8Gj7ZrfXSNl+0f/z3mKzZZhYC1apbDJtVlHMwpdS91xTyn7D9TUMj
i/m/ODlQdLp2NXlcyu2irAU7B1bG263uHCdDsJvPTPaLMzlygUUKIMnjGcNZP5yEL+wKFoedrXZh
+q3SXogmG54Y5J2KwF7AmhtfLpp/F0pTwijpJ01dVWRkz4YnVO0Ao19iWYge4NxWoiCei4DRSxga
qq5Chz6mUBLsv+WBgNBVfc++IRGEEqjGQbE0ZyFLoOeojw+kjWDz4qrjzpSyt5Quofe9PUWb+Qtl
Ff27FzhbNlJHWcxwB5YBLvJo0tM/gJLtxIuo3N8C+DE0euphOMgN/V++eRdHYEB+p3fMoPPhza1r
OrxBbzQ/S4b896xLOrg4gowNpcsIrU+pyI2fPFi+aCxzDdYJIpC6peD2ny8CQjXTt2nWjDd+duX2
sQ/2jL397FzBwMZO28SQSChVO/6iqF008WZyRd/pDXdXfzs5R34OfsQbc6tSNfDXRosm4Dau+MW7
Z2E8CmdMo5DBKavqxBpAFtrkJlJ/kWNd4CsPAawIVM5b7jR4bAl81I0UMLiLsEW1un4mKsbJgIyW
RTM=
=Adzt
-----END PGP SIGNATURE-----

--------------l7Tb4UlcFDzsW9lLNuQAqkCa--
