Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793253850;
	b=JAG75uuYs+7hKKhLMHW/pdi4OGq1rDzefesVQrblLbUI/SvGcthIdwLLG4LI5+VzRppf
	 nHg40pknFeCxrVNZ9vipLwye1kVLs7+V1xUOUZckJNsbXTpsQuO+RxQrPMod1/svqmBhF
	 CRXzgKQPTJxHtTcps0DD3XX7HqjdCnmveRm1+fSlEKB8SrFSEG6IAYbFWWkUeR0fpKjTE
	 6P2AIf3ODepwVzAFndpLY4etgmHRMiFD+wb5JpPGzNSJYnMPxfR7zLAmzE5InhNq7Kv5g
	 nVFg0/zU95sDdUTEgdYvhFrYPRkjGNwrubYahWyAu74LVP7MMu9eRzRGx8LpMek0Dpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jyY0mISq30/hBaQ7vdW5SKnqvf4R26xAX2ccXy18/70=;
	b=BLl7Yiq5T+LqqJJo3X14Z1wT6SO46G95hCV6PRYOI9bMJVz4ykYjG9soimaUDhk2TGbU
	 hSLiQjP3Z/iEfoCeMFr18gGF5csbgcKofwsSbFRYJfu94uxn7Boju02qJCKEzRhsQAvIe
	 FjlymfPpLq5p/XG0AM1F2oHsaA3MJfGXAvqe2qtDmLdZZ4e7BwOUmulo8B0qauYGKLX6c
	 owrJqxOobvHKGkvYl7lnzzEt8C1p+DsRBvmMnaQTfLgIO5ToJ0tbp7hld8aQglpfD+AC1
	 mfV267nGn/OQKGowdNKdlaQg6q2mQIGzUcDGfpWWovylcgW1D0rBdu+QNa1S6hVzsiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9fgJelk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6921606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 06:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6921606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9fgJelk
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso1339718e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 23:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793253848; cv=none;
        d=google.com; s=arc-20260327;
        b=SWBx3mQce7bdSC3hAVN5yHUvEnCLOR0o3NtoVyDc9YXEdTA2f/lrlLXWNg31r+1K0J
         Qigml/m/86AjhzFlOtmvhS8qHauPCYx4fBJXiO+o6B+0bu9DrFRpGqtjfm7D8xTBzpL8
         pFbFEGffneVf/7JMXjq82FGoBN+VFhwyyrhjksCqtC89i0A7YbKUNiEVQC01ePSQFuTt
         b9qK/7taRbIlsrvjfhT74KM2jkaVk405LijOXkOEQCqf1+PA2EeSEZh551Zh6I+jd2sX
         Ap2QQkFSKWLFMF11/qCO8SoYu0+GvOyQcRtSf40lZpnZk4+aUEynqllzBQPKrx0i1ced
         ijyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyY0mISq30/hBaQ7vdW5SKnqvf4R26xAX2ccXy18/70=;
        fh=INjNmmHA7ztbj5+a+SXdF/cS9e7eP5VrVRtcqQVr4pU=;
        b=gzV1rXrdGZMEaAcX5XWj3zLsCZS9jyu4V2/eEvr2BO6PjrveDvLU+eoTPAHFou0sjb
         VwRIJS8deDGT2VFVUEUal0SjdBnLMmmYKtGuiBSkzpgGM3Ny2sZuA9iDBgchKZsjiY6W
         Z7TIM/NhGJxCNCn2ERUH6UgV3ASWDdSnO479b6a8vSA7/diZc2TvuhXLThzD6IHhhcDW
         npDhd9nnJUU4Qcebvb6d+CMcTQkXduJikKWIv0N5y161plZielOChE7zex/Ylu0K6saX
         MxIZ+Vny8be3oFULbfPEFCsYlas3/sNV0wgBt7Y/+qMxiJIyQi3IIE9NyaHYIrmZoWSQ
         S8sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253848; x=1793858648; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyY0mISq30/hBaQ7vdW5SKnqvf4R26xAX2ccXy18/70=;
        b=L9fgJelknCvwTr12bWlM9nqzCpdLzjZswLfdCVB8br6akZBwX+ifXW4h8XxIzspgBZ
         tWb2c7AGkQTwUdUx3iP9tfRSVk+XI3LJDUKh6E5QJyc52vcj7FlR6Gq5Cdp/jh4tLcS0
         r8srK83JPrwx+9XEPlHofERUhH4cQPufPuQYss0K1MVq6iSZwm6hhco8FLSdOzRbGZPX
         v51Bl3nqvn0ybrvTxfIf540gPA8TtWdIElGGOsQ65oB42Jfml6uhtPDFRe0k0N3tbwSu
         8sIuOkfLeHw5zMilm6z7vXq+Gd/6wYGC2hOcwV59lK/LPum+nsDXk3Nm7fztCmRQazie
         rBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253848; x=1793858648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyY0mISq30/hBaQ7vdW5SKnqvf4R26xAX2ccXy18/70=;
        b=1y7rZK+6bRXMm6x9dFXFModS47Q710n3K/mwHMyyKBgQvwUonqtPdWhiAlgKokE/Aw
         PK06Wy+DbBMLRrY9706Qa9RGZwnaF82NHfIbEzQpLcV7jB/nP9IpIcovUz/ZNimKxFP+
         Umy0j+D7OzzEcClVhIlnH/P7jH/qj1b3RArdzbq2sxg0cAXZI25LDS6QNHsLEGjOc2PH
         GPe9jopiZEsjsDwXMZx33LTfSgS0w1JC6WYHlLcvRzK2KhZQ22oHnjPsHDwHTUwYCi2R
         65v/ktUk5r61X9kucDyRPopOQ+0H7MntQTuMrlQJFLM2KbgPNJ9tLj1EWbeGBg950Yya
         +8iw==
X-Gm-Message-State: AFq9FYJcmC2kpyw//jDqiFjZ3CAIG3STmCHydYxpPyWtgy6ebpwH43P6
	Wo6J0EjvwU+UaVHXPeiiNuwJWj+V2swgBH/Yj1xB9CodhYZZeUcHYFLEa0Tqfo/cUVhYk74GnvO
	72tom30Ri+dnhhpWCs0bSlkexDsPlJivQ7w==
X-Gm-Gg: AYBFou0d/tZR+t4lowE92JhFvxyo9Kk3BcnWd6L6UjQHy6vMhaYqDpWXRXVKE3VTDOC
	iHhRox6uaeaxnp9Heq4s8FyfOs+hwqRO9YbvxBdi5xldpJxA+XvJ3E95dvyhv7JmEP7G9VCD6mq
	xOrzBjh9wLaQA/W8r1Y304hLwl5YSAAojM3Y2q1OIH/3F/TsIqSytXSiMJsPdZY31MI1s54kdOk
	G8PtlepK5F1oeTS03sbuF7X8hhR7H43OLX3MWdtMkGxksLqQDnCFL2zEHt46MpVmrAjFJ+agf5N
	BS8THU+gNIZ8GePmp+IwmH1fno9UNjKL3e7UBdR/TzYROBNDJApYyxwH8ZwsJQqq/GjWzt2US5b
	1e5HIxTVv7wd6HrCWp5jFgXKZlAH3Efml2cl3
X-Received: by 2002:a05:6512:3f08:b0:5bf:a42d:9115 with SMTP id
 2adb3069b0e04-5bfcad31a26mr1709830e87.4.1793253847632; Wed, 28 Oct 2026
 23:04:07 -0700 (PDT)
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
 <20261028030503.17923-4-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188655@kernel.org>
 <CACpmpodu3C=uYH6dmFM-xkvdJxiRDjamRKs1Q4jU6_KKjFWNqA@mail.gmail.com> <auLbyon-KaV5Sw5_@gondor.apana.org.au>
In-Reply-To: <auLbyon-KaV5Sw5_@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Wed, 28 Oct 2026 23:03:55 -0700
X-Gm-Features: AclHuK-DCy2JhmM1ocR9rPIODBB_vde0-q1YKusn4WlZiYizVxfQyHZpW4RBSmw
Message-ID: <CACpmpofcd=ZPKhAoHJfvJU_JZshKs1GGJZf5JhjAW1PZzDq-Lw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] crypto: acomp - Add trivial segmentation wrapper.
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: sashiko-reviews@lists.linux.dev, hannes@cmpxchg.org, yosry@kernel.org, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, akpm@linux-foundation.org, 
	linux-mm@kvack.org, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	rientjes@google.com, willy@infradead.org, senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:38=E2=80=AFPM Herbert Xu <herbert@gondor.apana.o=
rg.au> wrote:
>
> On Wed, Oct 28, 2026 at 10:09:35PM -0700, Kanchana P. Sridhar wrote:
> >
> > Herbert, can you please take a look at this and suggest what changes
> > need to be made here, since you are the original developer of this
> > portion of the patch. Thanks.
>
> I think we should get rid of the changes to state->flags in
> acomp_save_req and keep it in acomp_virt_to_sg.

Ok, I will make this change, thanks!

>
> > Thanks for the catch! Yes, I will add (!acomp_is_async(tfm) &&
> > !acomp_req_on_stack(req)) here.
>
> Why do you need !acomp_req_on_stack if you know that the tfm is
> synchronous? IOW, how about just testing !acomp_is_async(tfm)?

I was under the impression that if acomp_req_on_stack and synchronous
tfm, it would go through acomp_do_req_chain(). Please correct me if I
am wrong, and I can modify the conditional accordingly.

Thanks,
Kanchana

>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
