Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD173BF665
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550617; cv=pass; b=erMTbz+w+79LmqMWcJau/IQKOHZFE2HD5K1yUVzr6AjWwGci0pzF4jVsGvzpzPfrpEulVwz3YeKqvn1GA4TOO2Il/Nh3L5NmEss37/SCcNcSUg0iwPXBor76iHR+17GIIB0CEelE3+WXVoz//86LIrCUiQsNnL3UcIx2i8WmyAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550617; c=relaxed/simple;
	bh=4HC8s43tFJbSgyaqkLOVyH2ryMUhq+vDGxIzbU0F9vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2gVoWq9U4TbTGYUx4Kqs+0TSy2tLburpvXLLlyeTcYYrLNrKL52uFR8DrP2DTfgqQ52EzIIuMu+cjzfVRkeRsCIg/KxMmVRqqxdYjzj2qjpVofNdIWUB01CKmH4iCW1kZSklwvv7Eb3Oo6fC1g+RuJEu2TqRKPJJHo4VDzaRxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhF1ixN8; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhF1ixN8"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6f8f26d66so318049a34.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 22:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780550615; cv=none;
        d=google.com; s=arc-20240605;
        b=j2wIi8vkDp8AFyPsl/jYfS5bxS40pJZQxf7HCdcv/+rCLS/NvycPkYxQynApHmZdix
         v40e1MFdzMnD0uCzbUNKssyVCvstH5vFncLA9lInpFxiAvOaalW5fNO97a9FAJTf3Nfi
         L9DVIJsKZLjNhwJWqJrpmZrt4rJ88+tP6777Q8t2Zgvc8c+EotUfqQd17vLgZIC5aEJo
         cLlpRVhfh36W4lotTknaXTjQ9tPEB3J9hW2imvgVJVMqplxJEPG9bNZo6+W+k4Mw8RmW
         1sD+R2kfkzfe0GJvUVet3xbnO2lU25eEzrMIsTgnuEFl/U8t4U/MKl9e6YxpvHfG+0ZS
         So5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4HC8s43tFJbSgyaqkLOVyH2ryMUhq+vDGxIzbU0F9vo=;
        fh=wyk7RlhnBrJLts+xkTX7UljkNG2sQfMr/p5mU25CN9s=;
        b=J27I+nmapUeb7sLlgbx1oxvi9Z1RCToCsUqME4YX/6IoxjFThOF1CauCWpj5o44lpQ
         vl2jSVbTveZwjY5QRMfKlSvTmL6SCIDD7IvMMEy/EpLB/7CImheDzDB7pfnixgWKYkOL
         MCMG6KthXs8PiQ9a3f0LjP41TlFNrAvRtz/d4YlnZzI7D5LfLuegUmlSIQGAGxuSvQiZ
         IMvfmgx0+wEE4JfGn2JHsPEMKW9dMOXq92WHw0MfVWbXo5oenFhefBrxHkPXEqC2IibY
         r1U7CttFS3EekBUegIZwX2MUbILDNPUXtxnZt4WkecPRFhZ8TA6sfhuMySAU8c5KTDth
         7e4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780550615; x=1781155415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HC8s43tFJbSgyaqkLOVyH2ryMUhq+vDGxIzbU0F9vo=;
        b=AhF1ixN8hXKZJ/1liXAZNe/lsZEiE/w2w1R5RoaD/1PnAb2nGJTtq18/NpO5fl3NDs
         NY1FnkGEV/3N/GJqPaWNL+GDYOhIIXv1tHXMMNq+inZREKVPdISUzskG2KPRWHjQ6IUa
         mm/GQjER4Wwovh0TEx70h520L70ZX6qXPRHTW3hr8kVVGV8A2NmXdSosuIKnGd2I+XWz
         JrnyIshS0rpsad2Ctx+Ood7IAKmnpC9IO5ra81LlFBYfb+qGWjOcGCIokQkKPS2tHcbD
         JbX3UqMPqvwoWNF251QPQR8kx/kRacd6fK5KCb/XnsuNsAIbVHcUXA3C9XAWIIPxKPy5
         JhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550615; x=1781155415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4HC8s43tFJbSgyaqkLOVyH2ryMUhq+vDGxIzbU0F9vo=;
        b=CGryjG0wQQ1rBTVUaOwaGhoul3tQ/ehrPAjduWeUS5/RHEhxH/kIME5BteIaDrjd25
         qpBOc0aMgBr5D2/sXVj7WMfLwLVZr1KxQoBPR8//2MohpdXkNwh8uft1TwQ1DfmsOxVo
         4UzlQayIMf6OoyDhOqvGqsrafKj0b/xClNFHGpy82YtY2IPDp92S1dBWOHsxJTlScqeL
         fPbFWMFezcYYCO3sHjyr2rt1vpMymDgKO0+pQMIHKGs+cEDNCfeYWGPYUAkhaQLDmD8l
         rmGHZgJLfURNmVnfIbWQx8hwwOAAAuxUoyv6lglMWnwx1IMCdcYM/ZfTDNVNop3VTpk6
         AKbA==
X-Forwarded-Encrypted: i=1; AFNElJ9XnodMAdF8Br5tqv7OjAV8kVp0taDq604rRSa1f2+oOrafHZy/WX8ygDJQjExxLmQLLSrDyWfeaJMK3kj+ODE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVLJkZaBiJu8CD6rM6Wwe98PIbAV0ekIVbxGKSADTDrMMqQPXv
	8oW57oTiKkG5qRdEoVXCZUOs4ueY9lWmakaDBTXFdNKjd9KycvvIGL5uCJjJ2MuznbGVfkWwslV
	UwAuJ+tHS2ilJRp0QiRPyOr8ipbi0860=
X-Gm-Gg: Acq92OHJc18qch3c8hmNN4U+twbNYOjA66qmrAUaNPryGDVe6QaE8QU9jpSok8pT4cY
	HjSQqBowGf9yGQyAbMdvNBSx+mYXESBEPn2VZjFGzp0qI2Q0lrARTeN5HJk0yorpxD9heRYDb+O
	gf1KT0VHF+CPWGY4VplEK3ZaAFUeWTjoZRoaWu4ojaebvE5+calMC16xevCQ62Fr7PPKFHd+gkC
	UrY1S3Ym5WgdlB9WTDnN/PsKtUH0VRldrb+bEQO06FS3LIR5d5d1HXHOwWWBWdeHkuDoBixoz4U
	2mExswrT51glOPRODC84mz8=
X-Received: by 2002:a05:6820:c2d0:10b0:69e:5e9b:a47d with SMTP id
 006d021491bc7-69e5e9ba739mr125726eaf.5.1780550615598; Wed, 03 Jun 2026
 22:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-rva23u64-hwprobe-v2-v3-7-5529a7b28384@gmail.com> <20260602232859.3494A1F00893@smtp.kernel.org>
In-Reply-To: <20260602232859.3494A1F00893@smtp.kernel.org>
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 4 Jun 2026 13:23:24 +0800
X-Gm-Features: AVHnY4KMEU2WhD0nvjMwpU3NMXUXsI7Ox3Ri4eRsECUeb1hKlU4cqSpj1AHXzbM
Message-ID: <CA+Ck9FYWCbHO6-BU48KLx_Lov7pJiSbAP8j3Te_uqFFq81rUjg@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] dt-bindings: riscv: Add Zic64b extension description
To: robh@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob, Conor,

On Wed, Jun 3, 2026 at 7:29=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> The properties block requires multi-letter extensions to be sorted
> alphanumerically. Because '6' comes before 'c', would it be more accurate=
 to
> place zic64b before ziccamoa?

On a double check, I found here Sashiko is flagging a real ordering issue.
(Although it exists before my submission.)

In current riscv/extensions.yaml, zic* entries are split into two groups:
one (ziccamoa etc.) sits above the Zk* block, the other (zicbom, zimop,
etc.) sits below it. This is wrong considering the rule says "# multi-lette=
r
extensions, sorted alphanumerically".

Would you like a standalone patch that re-sorts the zi*/zk* ordering
properly? It's purely cosmetic.

If there are no objections I can send it as part of my v4.
Let me know what you think.

BR,
Guodong

>
> Does it make sense to place zic64b in its strictly correct alphanumeric
> position, rather than continuing the out-of-order grouping of the existin=
g
> cache-block extensions like zicbom?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-rva23u64=
-hwprobe-v2-v3-0-5529a7b28384@gmail.com?part=3D7
