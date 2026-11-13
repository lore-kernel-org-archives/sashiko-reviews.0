Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794552452;
	b=30swVmEqMe/bWWCTh71ru/AWgEjpSgFSuyCLJKRT4iZnCMSlJEBYQr28NZAwx+q4yYrc
	 I9+xAunS38egvmYSaU5ZYlbrCZ1gC3pTUcWrwHaTeTBMAqN3luHDnw/Nw7Biys3Wtb+Mz
	 pXrq3HoZ//1wGczw1zr2UxzB+XzvjFSB8KFlDlGVVCgGqhS6jGGJ8tOmI+zQ/gXuwst3d
	 xMLOoznFGHe5ShwPYHiMY71pJS/+rYkzFOcH1CPgFer32D6DhV+AG/WeV6/VYrq76euhM
	 FmDr8xs3qJrVrw+4s7xGElFccnxn7X2xIJMR7O8wdEntjXnys33cdJVHQIDdA+3qDtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=n8bxBGcHfkDJnNGUsjQbeM0Zh/bCqD9yhtP3hgUzXV0=;
	b=S+kLOCdzZwV9HccIboMTblNerqS6ZaJ6k3MH3LhINCKp13rizVM1poT4RHfmyCaM8CM9
	 kiWtnb3uZ9refhBqDUWY6aHeXC1mZ+YSd712hqu7GA8quY51NOoIm3JWXrqojTdxbc6vz
	 SSing6dvVKwPgiHhUeP2LZMg5S7PXNx996xR8P8mNBTESAYrqTOIUW1SJJua+JccVJ3z3
	 AeuIKta3WLwuKby1TbqKOP5fPsRaXwgZMtPZETnF5Bo+V9jVtCTIIZaK3qMNmVWc/CArT
	 Zc37lHeBoDigc/jtM9ny/1S2mcZUuvPwQcrIzIC0tRUn3pP+QjlmJAco4+Hc5SFAFSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shopee.com;
	spf=pass smtp.mailfrom=shopee.com;
	dkim=pass header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=Iaf5URez;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08364606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08364606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=Iaf5URez
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so1674166eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 22:47:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794552451; cv=none;
        d=google.com; s=arc-20260327;
        b=lzAg6YDu7QlYmZptAhELiXo/Ding7w+IxFZFRF+7tiBvjdxIjHemNtxbRwjIcUujR1
         sMG2Gh7ldvQJBiOLsKs/aZFNzfFxSjuYKi+wIhu19vrmj0FlwX6Hex3Vr3H2FAVGJwni
         qSr+ZYw5JoTvQBobgOxWP0VGfSfeTcLkT+LBzXjYKypLemi9ZFVyfeo/OsVoaqsfBttR
         toiBmI1t+K+VEhCOFOx7MENZBezRWWtkmWzb+Q9MggWgGx2z6yN9TWky/1myRuah4Gxz
         jxg2UnMr73IgrkJv+DKqVgw34rSHVRbNGcPzUG1YAlB5kMYTTyo0dHqIVwFoXoy8E3X9
         fO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n8bxBGcHfkDJnNGUsjQbeM0Zh/bCqD9yhtP3hgUzXV0=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=mgkVR6gRDrafKdNiSvj9hj7iHytRvJUmfn9HqhCiPmbU5a0wvjeIz+LxG9r9YmhSeX
         ghUxo2qJTT2m8OTNpnBmsYbABsaRlYT4++5IFvJoA9ohM/FOC0yB1jImDowYlIIl0vF2
         jyQxkO0U+/Za/7k9vJiyykWFlWW7lzFUA+10zD6y+Jc/8LGcjbO22IR3qfgnKBpEeyFd
         y+6iSGnVwTewbg/q/IfarZUPi0q+Oj+B0dH58aOP/DkzgqOtEqJg3tMBrilr9KeP2Le5
         QB2JvTRA1AJCpDGKe8KWDG91Jc2pAn0xvYAEAEA2iq10muDrYkvbklOd7cn6odOkObVe
         wm3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1794552451; x=1795157251; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8bxBGcHfkDJnNGUsjQbeM0Zh/bCqD9yhtP3hgUzXV0=;
        b=Iaf5URezYKtsF+sA7aumMEBMg5wcJkDvs7JFXg1KciagQ3eKIIXk9OJPmNyYW5Ylq6
         B21NtUyQVLcfRVYNSYJWibgIQx2D51k6U29xbRewOV5w/uhA+dKPWBt5khwKAfYxZG48
         PNX+m9g8DQDQWnU4J77QBI89IrMvvDl6uUcOQrrQPaazbvrrjcLO6XzupX/mnMn8pUJL
         6Nxhd4hYS5zklWKylH1xkgXKzz+7F2df4+OM3ezzwS16A4gd4ow3haLIpabrsKDc7mGm
         zaiLfWGGBhP+/msZ6Yl9SK52HS6cPiAiQpIWcn05xH3Y9blIiJxgKzzNkBhK4S/btWLg
         VvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552451; x=1795157251;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8bxBGcHfkDJnNGUsjQbeM0Zh/bCqD9yhtP3hgUzXV0=;
        b=L/ajp96UMtanOhevl2bZbtO3zzWKRfvYkSkJR6ESbVDN1SJcJkFvyo8EicyFZFa2jT
         2Lj7PKznNRlrCcKMF8DZHmOk1vFcJ/KbGxQcz3SJluyEtaLlHyysia8nFQ/b8A6PTsIf
         lYxcGhRy0OJ69WCsGfKgFYCiv0r85e8cbfPVx6rwvw1To3dnFopsCCgFLFSCfl2ebN7a
         eV/wKOPRz8YnVHHu28bKMfINVQrLe+vrXVbCE+lqcSNTMqrSigILEg6cDE2aBihMqEGW
         O2EItncGmn46xwthsOZkqoDGEM2afUfwFCvPWBgvhY/AyIaZuMpkb8SXP+LWMU2/UIKA
         rExQ==
X-Gm-Message-State: APuU4Z+amkQay4z+u5YmMF5hll9u/Ae/erQjgeYSFnUbywuap0XiKbx2
	5/mNyS1OOJJKbacM7Ev7LCt0NoQXw894pOBEmJk8KXhckVrrZUJVgzIgXbBRqDJuDQUMj1+fNPJ
	BisjK/qDS/bXfP/3Q4eeT7anhERrmeHp75IcQdXhpanc16LAUgwkR974A8aUk
X-Gm-Gg: AYBFou2S0wFo6A3+sEX/Y1ORUY3fHLCCcchVn1+Se/zKYg3bbol/g851oVHro9lnKEm
	arSKpYh63zlfrOJ4rsJSXNqrpMfaBIyvO8emZsYg/0yfzm27G9KTEQ1FxfOY1geFC+SNt5V3QYi
	zfpeeVUu9uS1fsm/yEvmqlvyWaeuldKC55MLP/ZlBpR8xKpWBEpvxsYpQ3T2Zc19HXHKDwerzKf
	EXLGTN1uD+ynlExkE1TmJLtLWUM1Uefls73zEZvtpzi9225P8Uq8lmLJRU8vuwiQx0qcP+ah058
	LLmhAmVC7CcVgYi7R7noduXdWbN5TuLCD5xMPw7GlP6wt6yRKROuZBoW7lrro+yBejDAXCRubbZ
	o7TwDQrmSWRTcerqd7LutZABgCBpH0lr+UB3Q
X-Received: by 2002:a05:7301:1506:b0:372:eab:d700 with SMTP id
 5a478bee46e88-37963953befmr1546055eec.1.1794552450846; Thu, 12 Nov 2026
 22:47:30 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112041348.66915-1-mingyu.he@shopee.com> <sashiko-outbox-212161@kernel.org>
In-Reply-To: <sashiko-outbox-212161@kernel.org>
From: Mingyu He <mingyu.he@shopee.com>
Date: Fri, 13 Nov 2026 14:47:19 +0800
X-Gm-Features: AclHuK-cI187UlYy_fXz-xEVx4Dk9Y0HpPoqq117YUjWQTxbvSyC0HwchxEkVvo
Message-ID: <CAAoBcuQH5cr18CnWoodGT_Fb1EA=kHi0PEVovSRDnDGp7vsBuA@mail.gmail.com>
Subject: Re: [PATCH v3] mm/bpf: Always flush memcg stats when explicitly requested
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 12:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Documentation/process/submitting-patches.rst requires a full real name
> rather than a single-word nickname or handle in the Author header and
> Signed-off-by trailer (for example, Mingyu He <mingyu.he@shopee.com>).

According to Documentation/process/submitting-patches.rst  line 439,
quote: 'using a known identity (sorry, no anonymous contributions.),'
and commit
'Documentation: simplify and clarify DCO contribution example language',
This is my identity, and it is acceptable.
