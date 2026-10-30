Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793386667;
	b=J/1EoLdFxGrmO/HpOB1CISVtwGiZzJDg1Hv2015dWqFScTmkm8DtTlgP3+Z6kw1/JZ+0
	 ci5WEIgx+PiD1Tmp1Pty6Q5qCJ2fjWSc28XCmSA03CBexxcEg/RnuMVtE0+wuVEZBstnL
	 UyaWlXsZaD7oef6t+bu+uyfdniSplajFHw5rVNqxIBKph0eZ8Ks/6PnFJwiP29xtb5C+K
	 rJsKw21xTtDf3nP4XEb2XP+NfGKJC2K9oJHV82PcnZWb0f+39EMWANIg2yLAA9nFkwc+X
	 vGInwMIa8MVInHwWnqwUaa4/EsKIZkalzXuh/kShvb6O9Mi3g8k9pulfM/SZySHrVFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pRBcY3homIpP5xla9/0NQdaZWVwsVBzqgn0COlmfJcY=;
	b=akTQdq0KQfssDllmh4+l2rr1cbMOzDnOD1CGEu+W7z1IPco1mGYV4NQXcTstPwCLgrj2
	 CV/E32sTS+yCCyn7zjfrTQ1sHy1gs5LQDxcSsib8m75Yg45I5+htP2lBrKm83pGfq128R
	 7QJJIt0Sh/8yN35+LAGiK1sqUl6Eh2/X3RRzNhTyajw5C83tQ06pv4dm4Vp+jVZ/JelPb
	 3BP1I2c8A53bCTisIJ9qUH82fwXhqpuSrrLAjid8zzXz7kVV5UcMAkAJ6GB6HZuG8HD1g
	 19s2CFc2drePNqW5eQ7fz2Om3l2ZdbDfRtzkOeHvHPemTEXA7J42DHgwYGLR19cn86A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drFKpSTb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5A6606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 18:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drFKpSTb
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be42ae8eb1so636741e87.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 11:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793386665; cv=none;
        d=google.com; s=arc-20260327;
        b=SBpawQigxOX40XMaCUt01XxHFfNRFZWDuW7zgE4yIkLAWHWs/UcJm3ePt3r4UHcFt/
         VWlSlOxqaQA0IFkto3Q6QH9QE26RoIVQOw1vRPzGDx8+f8V5OjaBwW6vRCk2zIEL2B1b
         jIIUa2sQ67rdBXd0xgZW4VCme+/NYc5AxBM/NKFeSIkS44FX7i+qTBThpviCVEVOksi9
         fkC+cH7KYpWjqHOfyVGi0Vs9/nKMnZGkvpluE96SFIsTqeNqF1f8Cbs4Cc8XOggpscFT
         XgSKtpydYVKEMyi+P8pLDAboR+Lrjl8599OpniOkXxgJmxKdfRlhVc5Xm/pys6uUlgJO
         MbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pRBcY3homIpP5xla9/0NQdaZWVwsVBzqgn0COlmfJcY=;
        fh=oqQNEFII4hE0JcKZZGltHoi/mM2JiWxG+J1Mz1VHkQU=;
        b=Cqj3tTxRfdTadtwcMgkuQS74/gNBtGdROt2YcGjsK7M3huKl7f+ZiNqNkfI7dPtEva
         yuFQslbbotzZhvqv8zV27KmQlGvy6SHu+5ELFho1bipvhWpcmtlezh2SUaRV5AA8jusC
         u4O2qc5TmKtHdnhxfXeHXS0p+ie5rkkN0OLzgo9KDVu6wRKT+J/d29KrmQiIDvhiYS/8
         uG4Lt4tfxB1CoHH1XdWJ1PLrcMq6+uyR5fvh8gf0T9pHycF1blluDgrEiOm4na77Hnlf
         n6RepIrhUqhALjMGhHvAPJq2ot57KijFrmoOo7s4Cre4apGZ27GiRhPbMOZSyqSUqrsO
         a+5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793386665; x=1793991465; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pRBcY3homIpP5xla9/0NQdaZWVwsVBzqgn0COlmfJcY=;
        b=drFKpSTbSx1FKoYoJBbIreF/L/HUttFPNEKR3Lqsh/F74B+bSq4iKa1NRZ+9uOaHdL
         YuVYIlXc2Tklni9tNQOqWFP112Hlm9VuLKv3nwQH0gQtEcmEMmZrb+ERTIc2DrHsX00B
         S9jGQrD6LhR2e7SNBXJZWjPvAYcziSGxUUYBO28HoekMbY3WsAEKHx32VIDKAbHCGa2L
         qcUngzGQUnhI7p5Ca48CSLah5LuSVhGPsQjri5j3M78BzavKnUjcrxGgKzxG513L2cZu
         PXLFBXb+UVXTgbXyqutciWeCoUwM+SKVqlpbK/DHAeSemew+oj0OArWcOxy6lbeD9BVN
         7CwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386665; x=1793991465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRBcY3homIpP5xla9/0NQdaZWVwsVBzqgn0COlmfJcY=;
        b=NWH/MUkjvpduQ6LhGg+ntSgCmk+QQ6aTpUqDze0TzL3MqeL7vmms92t6HPBpM91PrN
         wtxX8/2uZA0v49FDTZ+9BYxhnYuurIBvZdAN8Ok+OEZQezDzaWjBW2FWXKJa3xzgOdZH
         j2IbmYbqz2CxmyE1LO8gqsilGXe8xKl9leRXNSktnManH/7vDWNzFCCmel+tRNbzsoz8
         T4L4H87K4BoT3hpCWaGp2lyxlDPV/Gs0aDVtjORowJ6JBgT0RRl+5FlKxBWjHQQaBWsm
         BePlf1aBRMScl8Y86v+3HCmSVnldomCBmC93qZ+Y4z6Ebk3CJ7jxRRF/w3cF5BwP60yB
         TDvA==
X-Forwarded-Encrypted: i=1; AKwUvBzKNVmXbTpWcr/iMaW4Ov4J4r2XIMPUaaYjPVEEGa4bi1EJSTe1R7uKh6IWTYfr25p0QEztP6xER7gWvrYdjpQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKbKehp1uUKTL+trPJa0N0zuhmqQtUSjuEbzqQO9wb8l7+nybJ/
	32U4vJ9t23UhAQwLZp4mp9fborVJ8HYqsUCPeXTWGUFwo5AAqMpK7OfrjyG67DxyhVY60vGYSfq
	fbC7/LzF8eHop4W3stk8QopUaZ/EnEnc=
X-Gm-Gg: AYBFou1JjeAUb/LgUOk4gUh6+EqVwYJ1Lc6YaHcd+hNrmWO2BMS3Emku8Kd+SaamuYw
	V4yCBlTCx8GyCw77viZ/e8MhBLcPHtgF3exfEwDoAhorbPek/PIjEgdSLEKO4GTKWNgfjOzG0rf
	5BJmXpeO8y0YBnjbDzwRb5dZpnMdSME6+XpzlFEqNUSUSb4C0iiJc5ut/urIlaefaYxcgk6biD9
	fnVscdOvsPipX+RsgFNPjHf30DbuDqSAcB1bJVogKI+DRXsq+UEULIREwdah99fph+VvO1lhaCR
	ZG0iiAEWpwetiJqzEzf2Ztmgn6u8owg38fz/PvyYUGSveNgynE9ILT/Zuf92MQuHWinUhxxTa1O
	g6+QMzxKF3JP4BXSyO1rtuLv7S/vFSlz4BoaJRUcj6nbTcFMFxobArZ2hzw==
X-Received: by 2002:a05:6512:23a5:b0:5bf:ae0d:5c8e with SMTP id
 2adb3069b0e04-5bfd957c5b8mr1213952e87.57.1793386665018; Fri, 30 Oct 2026
 11:57:45 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com>
 <20261028030503.17923-7-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188658@kernel.org>
 <auQhULh1VTh6lWoe@gondor.apana.org.au> <CACpmpodWMtmE0yNVN656K-8fPZgTj_DSZ0J7qxou+5Asoht+4A@mail.gmail.com>
 <auQwWgMbBuo0YEBI@gondor.apana.org.au> <CACpmpodxvQCkQgXUU6pF8d7onxHvHF7sEYCbTkv81WXyyrFiEg@mail.gmail.com>
 <CAO9r8zNvy7ftXsmLnj4qbQYJ5nyQo=hrio4UQvNrpMbwj9YbMg@mail.gmail.com>
In-Reply-To: <CAO9r8zNvy7ftXsmLnj4qbQYJ5nyQo=hrio4UQvNrpMbwj9YbMg@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 30 Oct 2026 11:57:32 -0700
X-Gm-Features: AclHuK9yf0museVZzj5aEtQylAllkhugfekxs2Uqb3nStINOr4M3_o9XKSMDYxk
Message-ID: <CACpmpodboNxOLAKRxOL75HtPawJ_rhOXUh1_UW1aDtA8NA5sxg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mm: zswap: Store large folios in batches.
To: Yosry Ahmed <yosry@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, sashiko-reviews@lists.linux.dev, 
	hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 7:49=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Oct 29, 2026 at 11:19=E2=80=AFPM Kanchana P. Sridhar
> <kanchanapsridhar2026@gmail.com> wrote:
> >
> > On Thu, Oct 29, 2026 at 10:51=E2=80=AFPM Herbert Xu <herbert@gondor.apa=
na.org.au> wrote:
> > >
> > > On Thu, Oct 29, 2026 at 10:15:15PM -0700, Kanchana P. Sridhar wrote:
> > > >
> > > > This is how it is in the current mainline, and has been for as long=
 as
> > > > I can remember.. I assumed it was because we need a per-CPU acomp_r=
eq
> > > > to be allocated for the tfm. Can this be done with a single
> > > > crypto_acomp for a given algorithm?
> > >
> > > The request needs to be per-cpu, but the tfm does not.
> >
> > Great.. we can save a lot of memory this way.
> >
> > Yosry, should I go ahead and include this fix in this patch series? I
> > am Ok if you want to take this up.
>
> Feel free to send a patch, but I think it doesn't have to be part of the =
series.

Sure.
