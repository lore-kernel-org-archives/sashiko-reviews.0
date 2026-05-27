Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F4A31F995
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892074; cv=pass; b=SCGKYrxtvtIUlDUhWn8bhFhLTTSjgSgAYYp/6eIegyrRAGEKYcKsauLRkH8/0CgJYhnWnekKLMuGuA9AArcj31AtongYGqO9odERQCB9rTydEb3KcehoB10r9HUjz0asenKmNimPy96P+tTvRTfMVx0gy9fgsLXLJFg1vZtgC74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892074; c=relaxed/simple;
	bh=ve1GxgwUJDqrHgI4wen/u+LK8bDh1//NcndXCcpRWVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIa/6aF/vxw6HFruxB1ISpS+bPN5tI2/832enCxPXwuZ8EdEdsdOSMi4IyKFV/W9OtK1uR/LFPDHYxYU0U2o/HwYR7hC3wv2t+GiOxLfclkXuItJ1zGQN6VJZw/lQa6UXjSNTUfO4Q6qF1aM7qGSoNWraVMyoVrkuju3eSRALn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F53rlIE5; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F53rlIE5"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65c305f381eso12680292d50.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 07:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779892072; cv=none;
        d=google.com; s=arc-20240605;
        b=Ej8MZCLHncRDqUToWDw4Gt8jLL99Ts5BboKc7m+xoI5RYx4dl5lUMGUmg0UaxdoAk1
         lq6ZwUduNP87EUUx3tcpRfC12UJKuOCvMVAgWABDpSckQPWa1OTzc5/XHvGTFZmDaJtK
         ccOw5GYk/8Bg785yiXSCE1tOV5ajD7vdhcqXMHatYKJ96VRqn8YQIQjLuwfu3MkP0lec
         gEBXZLnS4NFVbzC+dPZq/L5ujSttPKr737FrDpl1qripueLEhDOih8zemp/OSgUzB7OL
         hcR7XPP6mdQuZjx9/huyqcBAPEkJwUD8vin1WXoQuM0hI9yCq1bGPoKJMRjbLhvC+7fT
         29tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ve1GxgwUJDqrHgI4wen/u+LK8bDh1//NcndXCcpRWVo=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=T2dK3izsBIoF9q28LRc2CGdmEibxFXjeiogAD0L8Tw1FVBcghwbOswmLA4UxTokfU0
         neijuA8GT94kGo3VeZ2mcp6Pcf3LomY1sNwtFWRuQek8LiI9VVH0EOoC2BQh9e/ag6KK
         ueVO9LCyK9lBKs7pl3QzVxbL2Vn+I3hx91XQ8pnsALLbzkBNO9/0DG5mXSbCHq/1NBye
         yvTO2J84UktSPt8aO+WXdAvhf0phqEmdioxFj8I2IjyRdY4hc6kNmxZ2kWKZtZ/Jzj+V
         LO6KUZcN81AqH4h72v6TjAa5woOnRFAZCMFKB6r1rLzyHk54YaaR9aMbT61obGr8Of2Y
         QUiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779892072; x=1780496872; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ve1GxgwUJDqrHgI4wen/u+LK8bDh1//NcndXCcpRWVo=;
        b=F53rlIE5QAhL9QxIuBbESW5OJTSKMJQ6NdCVuR8SbVhphVRuxhfZVkH7XeEXh1JGgT
         IAgjizMYTB1vAfMZ876z5uIVwf4edk72D5PtfiEyS+j5JsJIxEy8iHg8WOqT62IwWQ4g
         3/2lVqUynH6Ri9nOhMcduF00RmXRWY7Xf1kgHxfdvUMCXLsf9yV0nf5K1tu7aale808d
         9cfVj5U8VkNgtOOFTgYS01RIN9sOD3/R/ZjOZTWynQ1wnQsfxQMxHVJGFsLOl4DpJc+r
         mylnmBckSGkIonlS+YK0T3koEwUP6rqq5GTKQ0grTUlkPO7cL9pwLgSeqv5hG0415N7/
         4/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892072; x=1780496872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ve1GxgwUJDqrHgI4wen/u+LK8bDh1//NcndXCcpRWVo=;
        b=e8H0XgDsMlkg2bhXOy50ZwoAYXUMo4xdQKBJ/E55YFDmYIXln5tSpdygxFJfqdpj9d
         h6CklN9tevdkinBKs6aJ8MW0WVakJOcHM3sUjEXpv802LPSSfQWxKhLS5C+bAGKar7Ce
         tdCT0f8BPhIHYNdvOdn/XHJ4T9w/7oh/Rie1/BtUqkHZChh9pWuvOYoOCMCeOmN/ByoT
         0XxH1Tl1mMMB3r5LKNHMWG060/kmbwh1hVUefA1Z2cYXTw+KAHeC8jb1mn8H4Cw2mp0q
         S4gZULwhw5tjBYWwoZHGaqAUYXZeZ9V1EaOiwcpATaFnkNITTHTyoAbjBmcwYdCApaYC
         DChw==
X-Gm-Message-State: AOJu0YxDkA5DBM25eFvDnc7CTkhfUYMlxofQqt5vYTgc8cz9Kazwn6bO
	nvK+p2BKGLaIEzs9nrqqzZPTnUEmPsNtYwnUMGGdaDYFLQrbXEexSBidyorCgbGMQUOFGxQ7+Ug
	Rq7STv2NrdbmfCejk6Y0GAdgLya0/gTr/8Cq3fODrLf8Z3zaYFRs61Wjf
X-Gm-Gg: Acq92OHbD+ifiZrMEucsGkL+uwyjyWrQQ/N7KOxkk5Nzo8fOyf+WzSvGk4gHvyYKdiK
	X/DImkVU91NYDgovO0r3ZTr+26weFC7SA+GB6oxbLhGPv9xmW+GE4134dvOuBQ4TmYlu8zwebqL
	3Uv8kEaGSZPTFxZ7SEKQCNccTtHRoclQ0wZuwUSfldFYFNAVt5+ZyQJEq8oGxpwnZyyHhbhl/02
	3NjVbcxLZtHlJkTHafKYBg85Cxh1Kyai0uR1mkwE4p6CvIQIozCCjWX3zr9HFreYoukJzu+iRMa
	8Jd8Xn2xSTiLR9wtoo7NBDC+0697+yOHyG+0p88OOgdcFeY=
X-Received: by 2002:a05:690e:44e3:b0:655:aceb:4062 with SMTP id
 956f58d0204a3-65ec98196a3mr18160634d50.28.1779892071374; Wed, 27 May 2026
 07:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527-libbpf-load-vmlinux-btf-in-gen_loader-mode-v4-3-27daa15487a9@google.com>
 <20260527141042.B632E1F000E9@smtp.kernel.org>
In-Reply-To: <20260527141042.B632E1F000E9@smtp.kernel.org>
From: Sid Nayyar <sidnayyar@google.com>
Date: Wed, 27 May 2026 15:27:39 +0100
X-Gm-Features: AVHnY4LVyxM33KMk2U-BKoGICs3t9VlSWi0yECqbSJyqbPhrzB1u3fMTEGxO1d0
Message-ID: <CA+OvW8Y4aRCtJR5_84VGPiySto_MvAZQkL1agXRk7j200vbZsw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] libbpf: plumb btf_vmlinux_value_type_id and btf_fd
 in gen_loader
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 3:10=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The patch truncates the bpf_attr payload, dropping `value_type_b=
tf_obj_fd`, which breaks module-backed STRUCT_OPS maps in gen_loader.
>
> Pre-existing issues:
> - [Critical] Double-close of `inner_map_fd` in the gen_loader cleanup pat=
h can hijack and close an unrelated file descriptor.
> - [High] The condition to populate `btf_fd` incorrectly omits `btf_key_ty=
pe_id`, causing map creation to fail if only a key BTF type is defined.
> - [High] Memory leak of dynamic arrays `gen->relos`, `gen->ksyms`, and `g=
en->core_relos` in the error path.

There seems to be a lot of feedback to unpack here. I will address
these concerns and refresh the patch series once I have reviewed them
and incorporated the required changes.

Thanks,
Siddharth Nayyar
