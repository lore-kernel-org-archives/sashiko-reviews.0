Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001108;
	b=rKqWWhEz62QSoT/LAjQCWQW3pYcc7j6OSMCJYhUet63Zpz5U1Osg7KjZG4H7SkLfP3zT
	 Hn5GmeF2qAgk/ielXgkR+znGKw23q9Z2HaR/PuV7cXM81Qfri3Vw4iPyK4gJBWpZAy/L0
	 5VyyZu8u601FNK9BE73FnZm1ssl3gElNTaRyfAarp0eWySLMDTGv69c2KTiiiNfK0mR01
	 LkQwGhmyG9qkNzZlSDzjWRnODzRexJqy/LNXh3V99av2+NCnOwkHN64ActLEBl+d97Fvh
	 wkI/Yt18uUmxv7Hvjyn4B5UWRMg35Xxr8OYwVe4V2esxvZRqOAslXMOnwtdY9XIblnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001108;
	h=DMARC-Filter:DKIM-Signature:X-QQ-XMRINFO:X-QQ-XMAILINFO:From:To:Cc:
	 Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:
	 X-Priority:Message-ID:X-QQ-MIME:X-Mailer:X-QQ-Mailer:References:
	 In-Reply-To:X-QQ-mid;
	bh=+nE7HO3QFyRL2Ai8GdADlUMnKwk6M/Zzpg853YbKlk8=;
	b=hu2LT4DzZDqcKaWR4iQ0ho5HziqkdB7FqWRKyT2onFX5wKeIrnvrnDy6Mt/a1hRwQj/D
	 /DYghCgQdCmXktlLaUKrHlDLDEpYW+Dzls3Do11NmrOjaZYk6VxJ/84oxIjNN7CWLycYS
	 aMZ8jhrKdxLKFthzFJ204RB0zbNF7e8o27RKdPBTKETPEdcJCAyhRlKhK5xQawkDn0EI6
	 ki/O4mjLAebsGj854aVw6uq5bmhCtwWD0HggcAgbXtvfysg91EayaJ3aQn/c1AycSKr3g
	 wtFFGNFL1EqouhJSH/3TSalf0GD7hHhJfNtmfkJw5JVaLj0Mr1Z9ctjJ/FAh78Z/1Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=JLSXZWP6;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884ED606A322
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 07:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884ED606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=JLSXZWP6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793001102; bh=+nE7HO3QFyRL2Ai8GdADlUMnKwk6M/Zzpg853YbKlk8=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=JLSXZWP6KWW+GlHF3YJRpnzX4kfrkKR9k87KrKARSbi79rfBdpIERkU/BFjADRuD6
	 6PIvXf4Zx0SeR1b6z1Jim7RrdfRgmbuLyrKF6KUra1isNblzx8C+ymvT/qbgiuBkgE
	 r1pwUeF4dAS3cc6Ud2b16pddUdpoZPyvuvgAM9/g=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-XMAILINFO: M+DG/l9YxNXY6gel2mm4emCwqjrguTLsCjqIzapjig9WrxrPVhvK0sVnBQjN22
	 VfcOb9ose1fjG4kHPbGy5o5QJSojF9/vLemsLPOnZNYciEfQVVCAI6+Mm7y28MMwRLJvBrOzyS6qm
	 9E6i0gbsib0YL4PFIwIPfnGKhNejU24E74tEbXW8Nj25/ERr95miiGszTkxhU2lVqtPzK4hBvg5Sx
	 x0sqfduYcsclBz6xxfJgB0ScWg6odScp6Pcmez4HtGInSQPs75hfk2UeNJQQamvjCipKkT0YTG7KE
	 iicVZ58nOPST6O8u3erBaLFeNaR6K8sJqSGFQiRa0hcR71E1uIMMykPn0+69qTIZir2skRFTwPgKT
	 nHlgg21zJ1ghqGgr76Hmd60yDNuupbTiLW2y5AxXpO8xt8zq5Pul166G+IGrYfcL/q49mPxzlm6QX
	 Ft0qiWlVr8iCLdZa1mzJp+lkB/QMGAVWjbWwd3GYPpgEh+lazBDYbkP9poVYqSYRf007QA4oI8shW
	 ajeAwTcN5e4m9BzkGbX4K8MOE/hLQfl24rrrH1uc+6x09Owenk3mlgnYlxQYHr2HsYBuT/wWtw2Fc
	 IsvYLwIN9BXHwk9f5LvLTioX62JF13VWDVFr2DynGgcbM+4eszjb+Sa03kK5LCSlKzXIh3QJlKdp3
	 mlM+j1ql2W4J13g588rvcayrmR9N6X6pwMOtM91kmrDWVE5FVgIGg6TvH1F34VzsHZp1Cc0oyVbNS
	 Sr6WaxeR2oanNdccn9cPrQ6+AVE1MUBvUwBoN8CEbuyQB6/4mD8PUx6aB6n/NNVwFfYaEY2+sRrCp
	 Hw3Z+u9oYIqRbupfOQ4h8PoUX9XzSmE3T1QmOTaGM19mDWjIlSIwIUx4LHcEZO8tLK3KNw1CJwFfa
	 rWj0Xf2TF0Rl1oBpepfgS6X8RdBx8OpY+oAHz0WN6O6E71opA+wwrFQtc8MyYViE1NmbxuzyIMYRB
	 sq6LEX+SUzkgdSxyiVD4vbClIzNtI8HpmArr81jXLwHxH4yA6JE7N30wQJiDxRTgWDl7pnmIO+dau
	 vXLyt6zHqF64fFVNFhBMclMjnaA==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?c2FzaGlrby1yZXZpZXdz?=" <sashiko-reviews@lists.linux.dev>
Cc: "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?Y29ub3IrZHQ=?=" <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/2] pmdomain: rockchip: Add RK3572 boot peripheral domains
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Mon, 26 Oct 2026 15:51:41 +0800
X-Priority: 3
Message-ID: <tencent_3A91A40015443A3FDB26209A0119DC84C007@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261026-add-board-ok3572-c-pmdomain-v3-0-70d614d3d921@qq.com>
 <20261026-add-board-ok3572-c-pmdomain-v3-2-70d614d3d921@qq.com>
	<sashiko-outbox-184654@kernel.org>
In-Reply-To: <sashiko-outbox-184654@kernel.org>
X-QQ-mid: xmsezb41-0t1793001101tf572a3g3

SGksCgo+IFtIaWdoXSBwbWRvbWFpbjogcm9ja2NoaXA6IHJvY2tjaGlwX3BkX3Bvd2VyKCkg
cmVzZXRzIGFjdGl2ZSBtZW1vcnkgb24KPiBwb3dlci1vZmYgZXJyb3IKCkNvbmZpcm1lZC4g
UmVjb3ZlcnkgY2FuIHJlc2V0IHRoZSBtZW1vcnkgb2YgYSBkb21haW4gdGhhdCBuZXZlciBw
b3dlcmVkCm9mZi4gSSB3aWxsIGZpeCB0aGlzIGlzc3VlIGluIHY0LgoKPiBbTWVkaXVtXSBw
bWRvbWFpbjogcm9ja2NoaXA6IGRvbWFpbiBsZWZ0IHBvd2VyZWQgb24gd2hlbgo+IHJvY2tj
aGlwX3BkX3Bvd2VyX29uKCkgZmFpbHMKCkNvbmZpcm1lZC4gVGhlIGVycm9yIHBhdGggc2hv
dWxkIGF0dGVtcHQgdG8gcG93ZXIgZG93biB0aGUgZG9tYWluIGJlZm9yZQpkaXNhYmxpbmcg
aXRzIHN1cHBseSwgYW5kIHJldGFpbiB0aGUgc3VwcGx5IGlmIHJvbGxiYWNrIGZhaWxzLiBJ
IHdpbGwgZml4CnRoaXMgaXNzdWUgaW4gdjQuCgpCZXN0IHJlZ2FyZHMsCkN1bmhhbyBMdQoK
cHctYm90OiBjcgo=

