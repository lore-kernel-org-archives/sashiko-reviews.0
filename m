Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F892E738F
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311304; cv=pass; b=AhxiJC1Y5o0g4UGC4He/EHHCJ25zFhquZ0kqUfAt/mu8HZYiIbCQs1AfcTJHsU3LeCJyvLEM//ESeeO6jvixhM71Uasz2zss+RPeMJH+bXq4x87bWcO3/iJfTCacEvDOQA5RJ5w44/Gc1XMJmRv33DOgUOVCjdIsx2MfIBydEdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311304; c=relaxed/simple;
	bh=Y1BhGJHbMK4MjP/cN4ZM+JrQmO+vvsB3JIjaBa6CnxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXbbx65TaJiRgTelhvwGrcewDddAUutE1kJJYaZtVeIOAonyrxHg15smTqVoVhhz/JA69AQcSTYoMsvmSqg1hRNZ23jeAy/UUqneZiOL2HN7b/HUN9poVniPfR2ZV6maZClAExSKWS3TPS7Yc5iOYexEm3GrSXMwlPh+oXrqczM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwpdaWec; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwpdaWec"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c2c08ff3f8so651296b6e.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 07:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789311301; cv=none;
        d=google.com; s=arc-20260327;
        b=p9OIXxybguiCabKE2XTERBXm0vQ/U6s615HdEc1nEg0rQ63V7iFLa0iIqRqcVpZ6ma
         c8HyAzhs8LmYtI1Buyv26TgAlWwZcb3//+Fqmhty/8w5qYE4/FkHnGY1BPDcgLfGgw2Y
         Crj9/rRmDmkCc60+5JQXjcqbPW5bKXgnhO6s9HqhCUV69mJOfiPJZXK2ODr+i9g9sG0H
         87KGmlZvN4zqX5aPb3nwOnvvz+yyVRxkGfQ/lQwROKaUlcDg4hePCz3hjzTgWiT5D6Uf
         wbL47WG9CPAZ/95iR/b2XOpKKj+thAwlN13zYwWK9o/qvgnJfvRpU0IXuBVn7bz1DcLx
         d8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zdUN+QWwa8fyRs0dHBEhiU+fM2pLoHcOi5IEgZOWjak=;
        fh=9vY36WWDWFQUjw+29Jn/cUc+EEaqgb02MVZHkBb8Ih8=;
        b=Df/t6CkO/CIkJZ1seIgV17B+/TlO9v8S7ZnAkawEAaNbQy4HwJMJFdRqiMPuNTZrNq
         4HEd160kT18hs6hnp1ahir4k2WItGlOg9NTRFX8AXmdJkPfNKgivmLpCG7St5CUy3PfW
         gzmcdX9+jyMjhGKDrSTAdDruuXgSBU3ezmsEyjHV1hEo7ipV5+RQrUuG579zJDyCERiK
         THzhmV/IhmNXf+z8UcxWgtGGXgXB3Vnca4kW8NC/HutGdwcsvlGsTWPefxRx8Ca5kXJE
         E301LJAWmZoWkK2bRr85W9TZLpluyzznZyH4dHWmDn+JrO1MkZGji6uqVssAlLod5b1D
         p9kg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311301; x=1789916101; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zdUN+QWwa8fyRs0dHBEhiU+fM2pLoHcOi5IEgZOWjak=;
        b=HwpdaWecqublWKa4pbgfiiVsIDI+FiZ8G9CHwqYfqXJG8ofD87ca8WFprs0f+ZSpCd
         V3pki3HGVxlthy6o5IncN+JgXLeq0/fhGEeW+ptkkIm3TNU3FfYFOd8WLfkHTefc5CfN
         DQP0PNTQHO4xOQXudBc12wDs+JqkFQPC29EHvsi5rDjK8qhztbmAbn2Ay7MacTOhozHL
         tx1XXktd9jbjPcOYgpCxbeMjG9d0GFfxlSXwsnSpG4VMe63vAi9aUuoBYGztB0Vb1WW0
         E9joINFCoIIkD9eqDUL3RmLBdq96EaD0/cYv1e1/JVQoC5CP/E/sIjRR0YwKOvJlAUze
         ZPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311301; x=1789916101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdUN+QWwa8fyRs0dHBEhiU+fM2pLoHcOi5IEgZOWjak=;
        b=VROwlCHmsR9/av1SqoCO7YU0ngAZdnAOYj9bzr7oYeqKPG31Xz/TQVWAFk6Z3BUSH7
         Qni2SzmT7cdFEiiSN17XG/6ArYaC6HE+DS2V/DPOa3hdpohLmL1nhY2av3lM16VKAlEe
         2q1di3nYma16Ao+TVIHhiuJre1aDLtoSrjOjbuIonIUg9yPBdtiEW5hNClkmD8ETb3Mz
         ou8EgtdYNl2KwuzDDTA64JIUAw2196a71ikh9lBj9jPsWzX7QxGUsAQWUq6hRooQ/z8I
         feGCI6+kPAn07B5MZFvCY9dnI2EJdFgkc+mHsEvMQMc5QO3dlSWEuQMMf6Xc09m501Si
         hPXA==
X-Gm-Message-State: AFuF++mgtEHrxWZvwkcbHIqvfLh8lfBx6eYq2LM0GQfIdcPaHQpgZHBH
	uqELu9H0kh/qxKE4E1C5DusXk4UQjWlt7Uq8h8YxIogY1Wqn44OC3KtcsUmGdWsFb6i8MuLUNQu
	zVS/hqhi45Ge1e1i1MgGjYcyVM4mF9QU=
X-Gm-Gg: AYBFou30biaJrAPg+WvWPcqlIJHm21inkoNtSw2bEwKosy5KFnU+fncZkGoc8J7HcgC
	G/wlj0jkfZnQU+J5WzCIrDpuS88lOPkS/WPd624ayNc4kHU45ijl/xApz2K18frOj6yZXfKnOKO
	g2f/hpdQgn4vYK/+z4z4Oq5YOhywoanZNM9qzjvMmFj+u4zQekjNM0+IqhWAYa+jgHugFX2dLFb
	pzMm6YIteteIjHC14PILse85jw7kZkAuHX7ZOFDlCr50bEXqNG+3X3L3Jq9g31WAzn8g9adIoyg
	GIXGgcHE3TfwgOQzL1RV9cFO1xsRyJarYEEwl19WujL9fEPmDVLlUiit333tRNf56FTHCjVoj2n
	ujhvqs7xWak0pGA==
X-Received: by 2002:a05:6820:2213:b0:6b2:69bf:c8d7 with SMTP id
 006d021491bc7-6c24c3c74ddmr3477590eaf.10.1789311301456; Sun, 13 Sep 2026
 07:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-2-amit.barzilai22@gmail.com> <20260823112814.896AE1F000E9@smtp.kernel.org>
 <8733vhmk4p.fsf@ocarina.mail-host-address-is-not-set>
In-Reply-To: <8733vhmk4p.fsf@ocarina.mail-host-address-is-not-set>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Sun, 13 Sep 2026 17:54:49 +0300
X-Gm-Features: AcwNN1XXW1xsHHvqDyl6Kgqlf_EPuqEBtUOLVnrobbG5_xucG5tBFGj0BV3mYoM
Message-ID: <CAOEgbEqd6pGUL6o2CbyePUWm=NBy1GJJaOm+_7rg3CsEGqEfYw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED controller
To: Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 2:16=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> sashiko-bot@kernel.org writes:
>
> >> +allOf:
> >> +  - $ref: solomon,ssd-common.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - solomon,ssd1351
> >
> > [Severity: Low]
> > Should this properties block also declare default values for solomon,wi=
dth
> > and solomon,height?
> >
> > Other bindings that include solomon,ssd-common.yaml, such as
> > solomon,ssd133x.yaml, establish default geometry values for their speci=
fic
> > compatible strings in this block. Without these default values, device =
trees
> > that omit the width and height properties will lack a schema-defined de=
fault
> > geometry.
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823111959.=
17029-1-amit.barzilai22@gmail.com?part=3D1
> >
>
> I think Sashiko is correct here. Let's include the default values in the
> DT binding schema to be consistent to what is done in the other bindings.

I included them in v1, Krzysztof mentioned that they should be removed
since they are deducible from the compatible:
https://lore.kernel.org/dri-devel/20260611-psychedelic-funky-foxhound-a8e39=
d@quoll/

I personally agree with Krzysztof, but I won't die on this hill.
Let me know which way you'd like this to go.

--=20
Thanks,
Amit
