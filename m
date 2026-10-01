Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677DF3D0934
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863381; cv=pass; b=g4dYOwZRakLUjeza7O7Mwitc3vXt9OOvckBD3gQ67GTd5KcuulQgRtH+Rijc78zGl4imsXxj+9AD+r5Z7kLLYB/QXTF5I+W6oVwJ7Ab2DaTNRoLBBkphn9RRqR36v8nCr7BsqD3+CRPaYTHSmyzzDYyoz1UQ99EoscegR/830OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863381; c=relaxed/simple;
	bh=d6FEHjro//70G/l/gSUyI1rn/GjbHT4yliKB3BRSvoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrTyrhZRMZSic7enI5dMiSptmw/EXTrUy/lRxu4iOxU6ejedsHEtHP8Y4mk45hPUHhPy0grTybxoaHRaDBigLu14ya36I7Cwttto+qGNkDNMZlOr1PSvl65s2hwuIo9GqTGEUVOXQTXZsBPDxUTM/alOpW7rZHk3is+De4/G/tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Df1HSgf3; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Df1HSgf3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso390638466b.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 07:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790863377; cv=none;
        d=google.com; s=arc-20260327;
        b=ZNXJsnK6ovnaoIiiU+w7QeN+nwzu7sSbhqQz+8cxa4YXjvIZ31hdkY3//+3i+yfgEH
         4b3HZQE62MxQevrEnRiROdGhIWlUKuJt46LDOZM4iCxVFNmmAa1YPnPPl6HVm+DNs+Zr
         pDxzS/83Wp4E8c5rSHRy63HwA0NbC++1E1KaOPM3sVs093OXMEYbQi14BHnjg5SgN41w
         kLNWH6T1Kw0olTftAvn4Mum5gCU3mcObe6uBmZa+ekIFZ5ha+x9Y9OgeKJbF/86VCfcR
         9dSMvIue6nwc8JrYTrFSsq3tnrJLzV9WKZhfElLUt6yJr95v0Dz58yuM7aUUCzqpxk+f
         DBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8/7CE4ZuKqaD2pkivrDjqtKal/kq71Tiz2qeo/N8RI=;
        fh=czhGovw1ORCXZDmDKjpX11tAOiV+9cU1czO48NmPsIU=;
        b=BkWDK3PugF4mJffD2yozO9OPaIuXjTixUe1RnWj24w1XUMO2Ie4gbesDpA7iKtMLnd
         9hx+Ufo/49fBGl057VkvuzddoHjGLnoo/h4P64To5mv46r6m7j76JhjxfTCGDzaO2vwq
         WHV031S1xcxTgNUspqCjjv2wl9duuudV7u4yw0GvTOB+MZ5A8CXITZCUz5lG4tuPAQEb
         XVB5G6v1zOiajsQykt3dleFkyMOd1gDaocHNW4X5+afuGrd/DHZYji1a6rgxexe1b2Rt
         JFdBePoCPsMoM1ssjMrZ+UtvN2/b0iPJ6UzR3yW89ZhHPYyriR4bqzpHma+4p9qtN+PK
         zq9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863377; x=1791468177; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8/7CE4ZuKqaD2pkivrDjqtKal/kq71Tiz2qeo/N8RI=;
        b=Df1HSgf3KQCjom1egdFfT6tkH73TcRtxeLNF+Sc0NmRU+YuMaQQZd4h5/Gk23r6xor
         RQ9qpLPc7bcAPVZzeOFfWPKhZgGWc8hKXgSn8K3RIlnH/aYhgzvlAi7H54IWTgtOiTmL
         czQc6XbVOvuw872Bq+0oFqrI704RPbCnQCd4B9qSnP0lt4RhXrd5wS8nPFmfQwlt30ye
         3Voh8CM0+E6vZWU35tl1bIgPEi09AJyOdBiWENOH2lp7cs5dvtA19chR4cfepGlu9j/D
         hpJ4mNZtOCEVZsoxYcVdIiFXGHk7x3l0mBrtpSmiFaECSF+xhaGVLhf4Zc924HZlvfEP
         nXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863377; x=1791468177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8/7CE4ZuKqaD2pkivrDjqtKal/kq71Tiz2qeo/N8RI=;
        b=0ttam9Cc3H4GQ+wgrHBuJrR7VhwezCAMGimnIqOhiPYw6qqY1YTvmJifPuvotxyJBf
         jVxeAvHak3XoMilH3xjTEOOuroyt9o/D5VJJJVHYkbs6yp7iGdYtP9sh3fkr9s8b4J9l
         6C8/6xeQmHKNKz8q4hDW9Q5ZoF7RVP6CD0DaLybUUCZManPLpK8Rehlf6AzveOBijcxL
         +LTnee5BcrJAp7azEmnOfUXgSKNbSdlAiWKvvYC4NF/avEI5GXuLdq7JCDXUBWQ65pMD
         3vzChqS1Ktdb9+/nhwQYfLfUtp4vDM1mD8uwb3Z6KtcE+KAWtlsAfadf5FYGrTMfpPI0
         HuDA==
X-Forwarded-Encrypted: i=1; AKwUvBynWNws6+nGvv5LfvjM9tV/3mj7uTJWoIIIu2yfIxrD2lE1Z6cbxkLnxSHlkTGG1EcPmFDCHZZVLmJciumzOm8=@lists.linux.dev
X-Gm-Message-State: AFuF++nfCFg0ZJx+4VeXlBvqmM6p1whqStYPPB4MTRGIIiU6INdK3xrM
	9mE1EO81Zyw+NJUj0qPDSfwcKHfGPO5wG/Ok9GZfRF6khmXHfpzVj3DmNXmNN8TVV2K3WvEb23z
	LYke5AiWmPeVl93Emx8phAre663nyWSs=
X-Gm-Gg: AYBFou23Zc7cH9A6pzyYG2p/RxDU+nRDUV3r28qcHTz4mDnuP0aiVdjfzNY2ilLj1Xs
	39yzOuk5R8eyidqy05fEFZsVgXRQ42y5wulb3ghYIbZD328+ixBwi5n2jDCE4plbzF7ez9xSKGf
	9pDGYdoJDPjWtYYd0lvKWTx0+kIcVyNZkUWTza0qdRAUYvC2TgMPzjhCUXEUEAXNUxm2DmgB3cF
	I4omLbStaZG6JXMEDfyRIyrmL41Dkg4d6co6dwwcbgN62P/BC4Uisg4wRwSua21m9FiOB+vb9Mq
	d3tMjntAHdm2wc8agJXR6YblP7L+ZHl9r94KDjfAA/p8FMpBWy2Ilea37hsA3XiqwoBXSWDtbrn
	zbBdc70nr77W802O9dARcZTX35mm6DAUX3hCASbyWWai+39zF1oApW4t9htchqDhoYEcEiiPVCl
	njgN59JWIVd+kNjsDLulOPSBo/ETcr3qqoHjyiOzJo
X-Received: by 2002:a17:907:9625:b0:c2e:2275:1168 with SMTP id
 a640c23a62f3a-c2e33fa28d3mr242508666b.19.1790863377337; Thu, 01 Oct 2026
 07:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001133736.802604-1-tzimmermann@suse.de> <20261001133736.802604-3-tzimmermann@suse.de>
In-Reply-To: <20261001133736.802604-3-tzimmermann@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Oct 2026 17:02:20 +0300
X-Gm-Features: AclHuK-Ck5Qo38vd623LvGwdR2qBOOVXPJ98wewQWMKyHiuuGCBfZRXpFz9rHO4
Message-ID: <CAHp75Ve1-LhMaLczyOyLYhXaHzhRVOTsG4Wi6c-KPT1VQJ-nKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/kms-helper: Remove struct drm_simple_display_pipe
 and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, decui@microsoft.com, longli@microsoft.com, 
	ssengar@linux.microsoft.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 4:38=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> There are no drivers using struct drm_simple_display_pipe. Remove
> the data type and all related helpers.
>
> The idea behind struct drm_simple_display_pipe was to provide an
> easier way for writing DRM drivers besides regular atomic helpers.
> It turned out to be more complicated. With all drivers being updated
> to use atomic helpers, it's time to remove simple-pipe. Also clean
> up the related TODO items.

...

> +++ b/drivers/staging/fbtft/TODO
> @@ -1,3 +1,3 @@
> -* convert all these over to drm_simple_display_pipe and submit for inclu=
sion
> -  into the DRM subsystem under drivers/gpu/drm - fbdev doesn't take any =
new
> -  drivers anymore.
> +* convert all these over to DRM and submit thme for inclusion into

them

(spell checking?)

> +  the DRM subsystem under drivers/gpu/drm - fbdev doesn't take any
> +  new drivers anymore.

--=20
With Best Regards,
Andy Shevchenko
