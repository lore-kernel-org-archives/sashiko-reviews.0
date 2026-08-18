Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956FC3A6EF1
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065169; cv=pass; b=UTuF6CghgsFwNiIs+aLqNZYI1z0Zl10Am5tCJvT6Drdtxjt7jWVH/kKY/evvaEOvTBcSPptd2qLnYWFLAlL+Ogba6wVYUD8N/VJvw724uM2fxAKXJDEWOt0eUR6ENhMpjbqs4055J7o0SbPQct6gE06ivjKoffkPHETgnT9wRSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065169; c=relaxed/simple;
	bh=auOWJSI+p4NXA2fRT5Cx8VbH8xiNgNPgiWdRlKFQleQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZPvCSwj8FDnTCepI5EzXwcFVwA99rRniCTOZv9a9K/E4kjfjLlVGeRtv2OimCICMkLf02YDM3+FJSBqFVQyyglrdM57cRmnwDPvsXfrnJeyxj0C0BAEm4h7+u3EILuQLrRoMPvZ7PkgM6s8GbgW77xoj5/9sa/HwWcwkY4PLHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cs+GcWhA; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cs+GcWhA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso38163135e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 07:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787065167; cv=none;
        d=google.com; s=arc-20260327;
        b=TL9K70/WHeUxYwzYCd/OQI6nQYFhg2L8K96ZsaBSHiaX1nyEzODkgwiH/SNVrzfyG/
         FI4GJoAHgXfi4Up10SvKe3OQKsmn+tJAquRxYwetYUCXXSdFdNV18CljEk1gDBgPwFTk
         xRA+q8CVJsesWAaL7ASuoKFHbfCCv93EpIjD0txsitma+dhLeZtnAAWX1yQdUprCxEnP
         2/2jKBpHbIvijBx3Q2YjEbP3jnieN4kul5JGi7UmJ32k+M5hQnM53JVY0npl3hhSEogj
         VB/RTDVvGCFnqcKHASwT4eOJLNYwyVrb+9Xv4md5WAd5Qznc0ki6ldVJd6FMz5ud6F73
         dhvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auOWJSI+p4NXA2fRT5Cx8VbH8xiNgNPgiWdRlKFQleQ=;
        fh=VzOA4vMZ0hs7z58xCOIebYw0hsP5O335eG5uln2UTDw=;
        b=DMatPTiZdFtwqdZxvFYVmILy31hLjYFY+O/3auXEVHr7XQMQKGyF+a8o6RQs6fn3fW
         zm+q5E2mIjeBFhCMetrtgHIF6Y0Od4XErnajzY0V7tkhNfGssKajzApgjcLz0YPTrBHE
         bi/JeCW3XgWIEqhf9nJjhHjDpCi838FPbT2e52tXB6gJg8qgZMogiyr22OIpyHfDBuIk
         7wpJlzIIHGV6TndJj2JAJmY7e/vHMsVkDGTEvfsl65KsVZzT/BmSU3FRKneciuhNPTrz
         r0JKzCybOF0a4ER6LQrgfYoOpFiXXmtryjK/Kk1rKvrD/7InWDOc5iLByECikRKTdASV
         Bplg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787065167; x=1787669967; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auOWJSI+p4NXA2fRT5Cx8VbH8xiNgNPgiWdRlKFQleQ=;
        b=Cs+GcWhAdFBfICauAO8wHpkZBlXEpPTToJcqe2LPIeaY8GgpSXWh21cHoHT0xj9se/
         xgTeGet20eyNW18Mmy0/6TRdbQg4ZddKucjG5PJpDa/KUyAKdJvkqJcqeXrr8il5hAZ2
         Ty9AGJy6e9xuSutpzdsKxTx+7igimNYTzRRu7FIPd3d/a9P97tB5g8TIShMtgduEKOhH
         QMlbXeHfCoHJKk+RrUOhF5010YWUpYLStgPrM4IyL07js/D0cvzu7JxzvmQLGHcn0d4n
         OB8IKO1yqHw/tuiI3N6db0zySOeBvUmyKbKJJjBhpiYbi2PLRI3V+QhHaqdn+AD08Tw1
         8IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065167; x=1787669967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auOWJSI+p4NXA2fRT5Cx8VbH8xiNgNPgiWdRlKFQleQ=;
        b=Mf9xRSyIRBTg3Ge0VMaPeJnd7ybpOB0cVNWF6mZ3oACG1MeDt0D0bvUgqI3o4n1478
         Ff9mxNGEp6eCbYOczRe3oy576SaUrdS/t02zFMb7HSQjn8jb4ahy80+rSNSlALwLX8xM
         mHM+nqEig+C0ehVJkM+uvhyPQJPhRc6wH8hVW/bV2bhj+RxnCqsKMgF4o5J/Yi8aRMZg
         qsj4tz7/wrN1hbF22SGCT/bDdO1Qdbcy7fN1Pzi/H7DXJxejVafPD03wZ9q+QvzP+TV3
         7XzZjlVaPiVc64a0J2n8ljIzpqIUuRa1WdEFQL4ehW7FHKcqPUI35VbcaHnG4s+F19v3
         8Lcw==
X-Gm-Message-State: AOJu0YwIEI0jRwSNGJACkc5KSZP8QwML5sYIlP+PBj8RufogxOuV3wUp
	PipjvJ4nyGvXsQ+/79qxQ8ey1JsAWHFwKGAuvjKATp8iOVz7YjztTyfMlkxupe2HZ+0Ka4bjfXA
	QuZd1DZY+Gu6beAsox8uddzbQ/Wa+kJw=
X-Gm-Gg: AR+sD11n0fxENvx6Y0Z7qOi2ayZ38Mrjwe0ILUYRckZxmxHo3ZwEMwDZ6oECf8DbNyf
	7wfju0xS9FUYWVxmQb2wz0Ul3n99dCsH/rhXrc0bDFL1xyj6o/CJyfcU07Rid+IQre1deyFelxT
	jCELzCEtwI2DR2oDqQ8kar2v8Nc6q/LdnhL2JWeJNOj3+ZrvaywWqVeemy83lp1VtLc48LG70pt
	Tv+Ej+2i9jypxe0NGdZvnbD6bTwabY95q0xGwDq4bn6xBvohejWD+/grzN0EskLVgd6VTkRLJH6
	8WYuYALDGxlsgnCv9LqmbvQQsZ0fQ0ItUHwCmmy9L+2eqlP8wvnUMqcjXl2fQ6dOa+fvM7SsFhA
	UvhtvLLW3ZFMK5zTa6dObhknIWCAigLlF3khVFKlRrd0/ul3bf7Hg5VInFIukYtk=
X-Received: by 2002:a05:600c:4ed2:b0:499:8743:77c8 with SMTP id
 5b1f17b1804b1-49987941ae1mr528130175e9.8.1787065166778; Tue, 18 Aug 2026
 07:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175655.6A31D1F000E9@smtp.kernel.org> <aoQ5INLOtNELfXpH@ninjato>
In-Reply-To: <aoQ5INLOtNELfXpH@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Aug 2026 15:58:59 +0100
X-Gm-Features: AcwNN1UCOJCIwPDBwZ6xtGRL3Omm13v2RjrLOXY3KVHS5j4fJiEaqJmGRVxTIKw
Message-ID: <CA+V-a8s_p95DsJDSZeP2Uy6=Nv4KZkKj0unLaojqR+yDZGTLZw@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] rtc: rzn1: Use temporary variable for struct device
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org, robh@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, Aug 18, 2026 at 11:51=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Should rzn1_rtc_disable_hardware() use pm_runtime_put_sync() instead to
> > ensure the suspend completes before runtime PM is disabled?
>
> Sounds reasonable to me, what do you think?
>
I haven't seen any issues as such, but I will create a patch for it.
I've seen patches taken along similar lines.

Cheers,
Prabhakar
