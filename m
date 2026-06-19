Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1F734572B
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857079; cv=pass; b=eUmMoC3+7Vs4OdWjuFqYmu4U0ES/uRU0D9iThljSQaqt/GxrFkQlRUsTUiBeGy3/HuEiHWe8dWItHkgXfg/zaJGw+cyMrnNxg6qGuHE6mxsLvxyA4Bz5Uv3IPsXiTqDLeD0yVo8vrHlKBIsiyBLkRrXZQnPdTeFExbTHJ8njdsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857079; c=relaxed/simple;
	bh=KA6DRUYfMDNKEHfy7weqCq+2Yu35KUFPv1pvOf6mSHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQORUMS5pf21M5Ft3waZ83diDqRp6973TJUJ8oVr4FOIKfJ+nH+qs3LsQjRffYH/wPaQR7RiArWQRapOOSjDqODV/k2xPlKzD0jDXCkfG7o8ss9ii0tsgbqISB+E21ovfN4YfYU7K7vL3g4QnKioZpvVjVzjsD71621iC2lUDcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LB6eBx8n; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LB6eBx8n"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5177d1ff061so114861cf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 01:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857077; cv=none;
        d=google.com; s=arc-20260327;
        b=qSBX/IgI9OHtl9DnR93v7vZC4OW1lI9vVvUNiRDYYxgzHHCY8A46VRj4Ry/fH4JEF9
         ixKtL41lpM8VzrThtIIdcLe75fXpLIEuy3bnf1qMohdBgL12HJcQSAb5Mvi8AKUGts9k
         TEHhZAn5v61+Oerf792jF37dC52Ql0zwAETWmJpl4yarxiTOw9iUeYhbN7Vxf/kn4Wel
         HqE0nFvu7fch8rJU47A2dEw9qsw3V4rBxbRuh9g6E2B5WcQxJ2V2zLqdCSXWglsCIIga
         yfGlFA9iheVrXXaUYtjipmU1XQkTP+npV2Ok5QKFKWjA7cwccL/ffJQl9CzGF4u7XCiz
         yfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KA6DRUYfMDNKEHfy7weqCq+2Yu35KUFPv1pvOf6mSHs=;
        fh=QO/2cIsGIfGCLZGcA2ucK9O8KUAei36yLEXUwefekOc=;
        b=KHlR8800x3SNGzoQCtDa1XGxMDV6OaJWVjyQDQEj/RMhTvcvNIQhJJenpn/hSzHoRo
         sgVXiFkB24poJQ+suuJ5YGkz8TSYUHbafLiFMsmQY4TEZFJfXQuEn6/yHyyTEBolqO2o
         /l+hyCkA02SRvRbRbY6iJhH7FiFh4tNCFDYuU4SdPxok2KaXXEbPY6lJOYvZv2HP0cSH
         OaOUxGCvsgHl5Gnt9EI2S2eltq6ftXMhP/aLNoK47huXQw9Pie1b+1kDY/z39XQXpbZ5
         bQAz/8szbD+IXFxLJXI7dzmtTbqFejwz+NeojHARAFK0i0S190VgzmTw87XMlATwzH4B
         N91A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857077; x=1782461877; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KA6DRUYfMDNKEHfy7weqCq+2Yu35KUFPv1pvOf6mSHs=;
        b=LB6eBx8nl6/5vFEWO/mvGnTxy54yRRwjayYNKxRLjYNiHYIULbbvV5tAiu+3eJ0yj2
         P1je4lk3T5Jnx+ntK8Z0jpXiqKMLTeoNB3sYvhDfjckb6Pn/J8Wt1K1rLCVErhBUG7JQ
         Qq4o7u2GEPDmzrMPqMkM7urB93OZwHqscEwYoYJDhUbZgVmfcLf9rpyQNBDAdFXEgV+b
         3NkBO4C2f6a2yN79MxfsElX9Kzl0k0fpG7c8wJqudWDueg+ff7W6n9P0AerChZBKJ5OG
         XBSTIcNBxCpaAv5G13GC5SaUwKWwXMD/xwdVibdtdkpFM8ws1myFfa9B7wZOb/d2w2rI
         0yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857077; x=1782461877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA6DRUYfMDNKEHfy7weqCq+2Yu35KUFPv1pvOf6mSHs=;
        b=lLTwJIkUFkBfaRY5iO3wvzWgtpxWJoLeTbzHO7kYejUlnPS9tZIwuvYVKqgY+EjpLv
         6wUunBAZ51Q1fwcNpJNxj28lxUyKLBARQzUgYYHbEGTOqRF63A+xeOMMSDUApNOw8X7p
         cqpdKeYUsdzl7RvsqfMfse7QDGrn92vZOz6rX20HJOKHM7y2X4235MlgIjtD+UIbkIbZ
         Pa8YTYFXH3C7w0wmHc/78TnJOfj+x3jwCswqNbM/ktEuhKSzV0iBqi7VDubhQwB6TKid
         0PymO8MdiVu3WA2najuxjGCJiYL2dgx1WjKdyknNriwgvoaeB7K6j6dH/2jy6wxLsKTQ
         XzIg==
X-Gm-Message-State: AOJu0YxZqNde+fY3t9DnzF9DpVoLUIVOcgmPnSc/NUckLWcp74Fni5vc
	AKKe3RaWE1QUhxwngTq7KPJMd1V/nsM6qRBiKY2FwbIv39NoNprJQIVPKxAxoOzspf1e+ADJBq2
	wppsAzEUcoGxaqYff8WE0YR96jU7KnE2HMJBSLsH/mXS/3ojdI+DBFN6kFsU=
X-Gm-Gg: AfdE7cm8WbWS0ifQzI7NnvYSN8TfwGudWtuf2wFfbiPr12qk6bNmN2T+kkPxUihLnSH
	6lR8HY4ihRAISQsgtfx9hOrNi24fQvnfebwn/okFMByUxS5cG0YcNWtQad1gEyNluu3+36tuaZr
	pSQSwRDuHJDM3ip/NkaaX8dgpyZScJeiQT9UbM7i+yuNAO4igTRMnXDZ85VipBYZlHt0YStzbK2
	K2/L9bsefTUNJ3LRcOdav3FJrKBpImSBb6Hn80aBVWAc5Z9fa3CkMDezcDvgrk6yVA/yoKilQ==
X-Received: by 2002:a05:622a:4183:b0:517:5ec3:b59c with SMTP id
 d75a77b69052e-519e489116cmr7174671cf.2.1781857076604; Fri, 19 Jun 2026
 01:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-7-9d2959357853@google.com> <20260619005533.984EC1F000E9@smtp.kernel.org>
In-Reply-To: <20260619005533.984EC1F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:17:19 +0100
X-Gm-Features: AVVi8CdmXQJb7WzuENzIP0MXl8aUdhwXeoyf7m3f_2laETL1i2q75b6p8_BKkxA
Message-ID: <CA+EHjTxdN+TsqSyp+f+8QO-BbOgHEebmpMhJbmD0D8quWg3s8A@mail.gmail.com>
Subject: Re: [PATCH v8 07/46] KVM: Rename memory attribute APIs to prepare for
 in-place gmem conversion
To: sashiko-reviews@lists.linux.dev
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jun 2026 at 01:55, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] `kvm_range_has_vm_memory_attributes` iterates over potentially m=
assive ranges under `rcu_read_lock()` without yielding, leading to RCU stal=
ls.

Not a concern. The xarray walk is pointer comparisons with no I/O or
allocation per iteration. Realistic ranges (memslot-sized, low
millions of GFNs) complete in microseconds. The "billions of elements"
scenario mentioned below requires ~8 GB of xarray metadata to even set
up and doesn't happen in practice. The `!attrs` fast path
short-circuits via `xas_find` when no entries exist. This is the
standard xarray-under-RCU pattern used throughout KVM and mm/. Pre-
existing and unchanged by this rename patch.

/fuad


> --
>
> Note: The format of this report is altered to provide a free-form summary
> without quoting the original patch code directly due to recitation restri=
ctions.
>
> commit 05536cc2fad8dac656829127ace4d82d1b522580
> Author: Sean Christopherson <seanjc@google.com>
> Subject: KVM: Rename memory attribute APIs to prepare for in-place gmem c=
onversion
>
> This patch renames the memory attribute APIs to include "vm_" in anticipa=
tion
> of moving PRIVATE tracking into guest_memfd. It introduces no functional
> changes.
>
> [Severity: High]
> This is a pre-existing issue, but the kvm_range_has_vm_memory_attributes(=
)
> function in virt/kvm/kvm_main.c appears to iterate over a potentially mas=
sive
> range under an RCU read lock without yielding.
>
> The bounds for the loop come from the KVM_SET_MEMORY_ATTRIBUTES ioctl
> handler (kvm_vm_ioctl_set_mem_attributes()), which does not place an uppe=
r
> limit on the size other than preventing arithmetic overflow. If a user wi=
th a
> large memcg limit pre-populates a massive range, and then calls the ioctl
> again on the same range, the loop using xas_next() inside the guard(rcu)(=
)
> block will iterate over the entire range.
>
> Since it does not yield, a sufficiently large range (e.g., billions of
> elements) could run for tens of seconds, causing an RCU stall or soft loc=
kup.
>
> Could this code drop the RCU lock and yield periodically, or process in
> batches, to prevent unprivileged userspace from causing lockups here?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-gmem-inp=
lace-conversion-v8-0-9d2959357853@google.com?part=3D7
>
