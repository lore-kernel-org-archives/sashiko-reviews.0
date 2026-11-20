Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207353;
	b=1f36vDJm1Nj+V/lHfvwrB0bksygoM+/0XuuwCrt6DMEfHcFONqCgBewlRlCbrEtFxXu9
	 bLpou5NqBakqaZ206FEprTY4Mf8p/o0xFsk95wYHJmJ4HS6jiFMYXyIryT5V0XRqxo8hA
	 hBc69PAf9VjUIgYCgik5kCUuFCabqhFQIWDRijNXNvAU19pyg89WTn2YgQt+R1MYerjrm
	 Hf61GTkWhpozbItxo8DB1XjXPeUFZXGa+TajJv5WnzrZ5uk80nVJKVw6hVZ/h5lOoYJY/
	 WEK4T4uH7msF/f1efjBvn6pfhaj1VR2F0fm5kNxbLEc74my7pT2IpDD58QPopPRUEDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207353;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=/nc/dvqxtPLsGgO4o7Y1s1suhT4X+uftd8Sz7H41zfQ=;
	b=p+c7dmz3Y/at+fLPzX5D2RkL1oxOqqzUokA4dhuX2mo73Ir4MJLbnT0XBX33GDIfvxSX
	 0zguGNHZSXdFkGyW/uH0MxZw5xgWHNAE1YgkySafsIcCRBkH99dMt8bCjCIKSbw4blNBl
	 V1LlluJxY4JWEVTwtqFN4BC1NMXii7Lch261cYhRD9gzSbrO3IK47ez7nw8ac1uwKKcpy
	 Ua/GyCczzSWqVv86ZKk9hNeddgI4COyCDQ/XCohlecRRZf6XE4suXw+won1NwttQAmJwx
	 pYEm+PGDdpk3C9IMgiwZtIvsn8OnKWJmYqbmyLn57V+Qf2ajUL5B9hG/o0phRlv530g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A7606A6E6
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 20:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347A7606A6E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9496473b511so155130285a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:42:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207352; x=1795812152;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nc/dvqxtPLsGgO4o7Y1s1suhT4X+uftd8Sz7H41zfQ=;
        b=oU4WNKMo6+rrvvnNekKOOPWlioBujgbkshVwLhTFdcrPdsBCUPE9yS5n+dyjDJgCXu
         GTwsGfkHbZjwsWeZkdenyv10RWbV2ncGpwX4KnAcUmNGDpy4Gc1Ut9bGFNDQQZQ92iVa
         S3GGmZqhYCF0mvv9DcAQxEbIjVLGimvbkuUGSCtte24dwQWsAx2its9E/gOUDTls+jyz
         SbkyswhK5BN44Vs1LP3gvNH9F13GezWLwISPt34cDVRGSnMaBCWJ5YZWN8Yv0v1HEkmO
         SpSeo5trkRBGUU1bStnh6nK1wNi2zwW2qfly9TXhJ+GzlvOc3Bxx/p367mX/G9Dkrm1M
         yiKQ==
X-Gm-Message-State: APuU4Z9iBAosu0zhn737nRv1aicpmwHnuSCV6YFfodsRc1PrfwAEEMqg
	tyWkgsp/l/izwtLzKpdrGrmRrXStLG8u3MHevR8TlN4L3YDDbzh/UXVyG9Zghg==
X-Gm-Gg: AYBFou21qVtjoAp/GiAebdvBYYoxyWA4SVa5gs7QXrQAJvbKRYm7xlLv+iWT6Ay11XR
	ujs+Elpz+cm484c0jQjyPH2/iHvwJXJ+mTwuzBd74pQNqymw6yVbjbdnOQ+5vlKbdI65y1s03HH
	sExs/iDgDTngwW1u1810zA27369+aiNqIzktUJ9ywCAF1vUeiShQ3nLyUz1A2HwWM7eS1sZuut1
	KZ6h2pvPnlbb/nunZq+NaVoWLXkPPaG3hGhyGHxi+PqHkmgDYYZcNv40NJbo1zM1W7ACLlJEXfI
	YGLOxSLYfYCsM/DZglQP8alaJ2Xb4d0NSHVVT7FZimns7osMO3Hngzs2SJ99tjXwukik3iSh86E
	qa/Zl/dZsy/I1WqFeZrDI0eArr5mOwxyqSfvWt/A4/PkXBO0pi8yhEzd1i6gIcseJjMfMpKB4Z0
	Au81PMOUu3FQ6hGxVXfEa81u6mFua1lW/LcYElqURwp5rq6zmAd85fZ1YP49bIq2XyT66GpC7PI
	+UwJdvnnGbETPVU+9wZ4/RQMd7nRveyBeoylIsWtKnKly0DHOFFubAsXBR/V/nUM19Es8pG+kYj
	I/qjOwBuUIqTAGO3G6U9sb29MzDWbyoB0pH0e8hTyS52mfAdFlFhEpNUN8GqM4pmAk7J2zVxO8r
	JbKc5R8+yw4U9sIj4tCcmrKFlo78nWTmn6zgisl9kSAe+hkOW+aeU
X-Received: by 2002:a05:620a:a982:20b0:949:ca77:6d7a with SMTP id af79cd13be357-949ca7774a5mr149266385a.41.1795207352202;
        Fri, 20 Nov 2026 12:42:32 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm279160685a.14.2026.11.20.12.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:31 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf v2 4/8] libbpf: ringbuf: Handle position counter wrap
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711436.18576.14633882852101651098@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20260619004130.23E331F000E9@smtp.kernel.org>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-4-33fde039ddf3@kernel.org> <20260619004130.23E331F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> compat mismatch between
> 32-bit userspace and 64-bit kernels?

Yes. That requires matching shared-counter representations and accesses
on both sides. It remains outside this series.
