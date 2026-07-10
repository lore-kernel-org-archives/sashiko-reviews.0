Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF0386C0C
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715687; cv=pass; b=XydVRbGf5msioCUDoeLQZIpOyP4F8BL0LYKjahEtToX04JafF887rZAZ+6DMxplub1UhDRCH3foAlprlG7/0+bq8E+in23p1UXSDbyqDqLiQdAdxscCt4VXq2dpXB7rYaEXl2FZH7vAqYva9mFVWaF6+kTQgzX7IAh8UCe03NMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715687; c=relaxed/simple;
	bh=5Ef7X/Kg3mKH04Cd3UXn/P4r6Kfue0PWlaV33hXZ8w8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ji8ZAnS5Ka8KHRRsB2xIaNKpWoOe2DWiZqdbqy+vXfLlaQqLJcie4M0UOYz1DXyc0cxAnW4beFV0bH//FJkhjgMk8k1J9trrx1f4He+TNE5CoP/2llVLtCUvnEwoWpyh3me4i0tBZDixDlUQnwNC8IYQuzBZ/VbKn7jYdh6843g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnDKNkTM; arc=pass smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnDKNkTM"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-473913157edso222066f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 13:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783715685; cv=none;
        d=google.com; s=arc-20260327;
        b=goUlycCwSgPKl/Xc2PnAkwk+hNGTFzEkssd1tUepgvvB/po80cSGmbeJXCrQo1Jgey
         9dL88jIk5dJfd6O6sU0jyXSJgnZFtdIBoqMUlGmOhSaVUwmHd33+z3v+GwWNTEYLbegG
         hjvAM9jKnE7imsS3qh2hEUETAsRgpVpibpK4GyYxYkcxODI07zCWgqXrq+1M659VIdQC
         4t3LEaHj/EYHl2AH+eVklK1AyEtGWiVNK4QGaVdLYHuItCL+nhkqfsSXH9b6iuRebBoq
         GeJDMd/Qqq7+X+6VimRPQIKLda8qEQgOgyAnkM7TF2nHp4f8i43CuOZeYtIPLkTifMOI
         SmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Ef7X/Kg3mKH04Cd3UXn/P4r6Kfue0PWlaV33hXZ8w8=;
        fh=0vIT3Pb4I4uTdslWT9yDbt6TROducgSQ5IFUrQDQYYA=;
        b=eLD2PikvLAjmORnSxldFIs4Td4j3Bn9bh2kyo5I1JhdF2ez2C49WI7goiLLzHC0P4l
         gHrvcIopsnqCgRsKt1ftgm+FgsGs78uPxG2wOx1ZmlWJhgfx4g1qadWOPQiIuEomWnlP
         E/qNaUd9kbBn4pZoiyFi1oOkjjjJLxIieS/POu+3Ny6CfIO1DpH8WIrZv4k8agsakIQk
         ugLJYrEqcXN3doDQN9uIdInOUAHy5+MRQ0RGMChG/NCHrv0Aaef1bbJIN2gfwNTNF8Xs
         G8KeZB2UExeGE99E1m6bB5AJLvdMH/Eh6Flmoj6Qopuk84GBg3dpvEjwhZgpv2IrTS5P
         yB2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783715685; x=1784320485; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ef7X/Kg3mKH04Cd3UXn/P4r6Kfue0PWlaV33hXZ8w8=;
        b=KnDKNkTMonCxhSKRNEA7u3XPdQH20yoK49tKYxH/Q+oABGW9Ai7ms7/xx6GNywHNCo
         JWpQPmydyP3WGOnA+Ya1TEQ+UgMuDLp+HidAbBLiu3ay69H8ncabqOEP1DEuKUNN8RO1
         OxW2qrWc3cAJ67t0uwugBuLAlInspqZLcgLzh5OHj5ZFi7NEoAjBk+bCm6JxLAtg/Vno
         Q11/RxsURTkkGk41dyQmzHKh21e+t5kYdISmHSa3ST+bUSoDimfRJqQPYS4JAETiOuhG
         xiOt6ehO5S9mjEHtNTeJ4MZTrWGIJS8i6wI+yta2GOiXccwPgP5vhUethvpKXf8xwRLk
         m2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783715685; x=1784320485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ef7X/Kg3mKH04Cd3UXn/P4r6Kfue0PWlaV33hXZ8w8=;
        b=ErNWoo3SgOTKkMEhwCf225G0JQj5+WbRC/gJQJ8ER3RFp6IezhgSNl/9oAi79EwOsR
         KrBOwfqPC0aRrOpsSe7A5a154vS4++AgptbZCBB9K+9ZaTkqn6aYcR6OHl6cJ1Fr1+4F
         WaAXNtdTHfQFwVLUGRo2YvA0unRBJ6+/v5Fh0bkKg8bJunOAvcG/hzoWcpbm4f4pac/a
         6AM28JQHWVvR0fccgUfjNxOEbzh5AFjDVKVvvAmemjxLuz+DrnlbIuAscepwnFSdPfNE
         /winy7LA+GsTSnvJgbutjAA70l6xU9r5BCtAib6uZOl4njdpt3UYxXaK0JZhdmE2J6jN
         2zrg==
X-Gm-Message-State: AOJu0YyjYgFGn4STcEwuboHMzyrnEpSmdc1+TLrHE/7F9SAr/pxmkdgG
	3xYdVv4AOpyETVoTMWZQQx/8Sjzyx7b+w1nN0rACIOJIvBMM0xR+sMjcq3+pzeeyZpMi/dVSzlP
	n6MLTK1T4I6dtHXZmTwz0S4PsliH1nKI=
X-Gm-Gg: AfdE7ckd6v30pfrN+getDbwKJhyGr+ttPw/zw3j73AIaGCsMXjLGfZf6oGdyiCxdUGv
	/xTMz+BN8G581ZNEKgiN+CfkTi9unhSDh3F37xhRTv5wiHhsgzaJwpPlqF50gvGPQkHg7Nt67Dq
	eKcqk1goiq5K1rlC1MMRlfBXYg7UG40727rT5tEDrSq+BSNai3DFIF2BlBDqlLCey1kDoVSK5R9
	dFWRAXGn2OW/V3ChbyfvTC0rZfk/G1ZcnhaWHnIF+5yiTA9BZqWPpv9zuDtLhTCrjr/QCUSvTpI
	VOxCd9HLwfE7gDJlhjAB7XIhKlshozDOyIxwgqGUiZyHVapAdCCYuf6ES1w+TbWciXd+eENNQ4o
	TuAOGcM64InSfQALPp8fobQ3xUSFa5coJZlYgHlgX7FkmR9+E74eQdA4EX2M=
X-Received: by 2002:a05:6000:1acf:b0:472:c426:2ce9 with SMTP id
 ffacd0b85a97d-47f2dcac21amr295085f8f.12.1783715684524; Fri, 10 Jul 2026
 13:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709182800.2037938-1-main.kalliope@gmail.com>
 <20260709182800.2037938-2-main.kalliope@gmail.com> <20260709183918.E42371F000E9@smtp.kernel.org>
 <DJV4TO9OH6AN.58C10SBPE8FF@gmail.com> <CAJZwKki8MwOmij3JZK=KnnO0hEUuxWA-iY=GK-TtvtVRvOkjOA@mail.gmail.com>
In-Reply-To: <CAJZwKki8MwOmij3JZK=KnnO0hEUuxWA-iY=GK-TtvtVRvOkjOA@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 10 Jul 2026 22:34:08 +0200
X-Gm-Features: AUfX_mz3R7qvDlP1KDXkHw9pd93r-GN_7i72AGy5AR_OgDccKGsl_2fsjDQ_Wak
Message-ID: <CAP01T76KdhEsbZj8yZN-yg5ogx99Ud87qqrhOGXTrX1ALdAgyg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: Require a BPF cpumask for bpf_cpumask_populate()
To: Admin <main.kalliope@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org, 
	sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jul 2026 at 22:17, Admin <main.kalliope@gmail.com> wrote:
>
> On Fri, Jul 10, 2026 at 3:18=E2=80=AFPM Kumar Kartikeya Dwivedi
> <memxor@gmail.com> wrote:
> > Once this lands, please send a follow up to address this.
>
> Thanks. Patch 2/2 covers this, which updates the cpumask_common.h
> declaration to take struct bpf_cpumask *, drops
> the struct cpumask * casts from the existing populate tests, and adds
> the borrowed-destination rejection test.

Ah, my bad, makes sense. Let's just wait for others to ack it then.
