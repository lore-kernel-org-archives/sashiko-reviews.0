Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEEF1DF980
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780216807; cv=pass; b=S1JdHiQtAMl2Pqovdl7wDWxSJw+OKrqeexmRqt7QydEJCzABeO5WWprqVBHLX8YZQ9ag/x9ynT3t6V4eix/cOem6VHrtqoCyxDUYHyqcSO9YzmOo05zPFQXe//9PByBqJJwpczilBheEVR8U42unrzKtJIqlgA1q4iosdfESp4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780216807; c=relaxed/simple;
	bh=Mp7e4yjhYxRDHFkPbMdL7drS2HhsJ7YpzanX5ys7ayw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/oCMUhs8uMN/LSX9aLFRai8uByJSZwCgDUGZUvZcHGiQ7z0yft0qKpRSQTlw2cZbzfdAAIqq+VpAfBqB9nmZlD7Bo56T75s+IomlinvostrA8wmMNTMQQF87WLJ8biQ98MslmJ4knyPjvU4NhWE07yI855oxUo1bWcO5WY/NIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bBLSA+8v; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bBLSA+8v"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-516d78ba1adso3251cf.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 01:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780216805; cv=none;
        d=google.com; s=arc-20240605;
        b=VBTNilC4LipO4JmXaRaupsoJ8O4ry3LJ48ynE3DryX3w67F/KRFkY8HKJIH6K8Pc1L
         uRNeAYuiZa72leKAFIOdj7gIRm3BZJ37Za77+T3BweKrhgYIqPdvZS3KW+GPbb11srHM
         6/9YD41mc+4BHiZfDET3EhDuLM43JS0Nr0tswomMFNtDq15EOEZH6NNfpuPfjIz0hDAa
         nF1T5OLwXrJXdbdX68PtwpRWXYUG5UkKtqjNZ+nj87cykM3QwrkNTHp682Bw6cU/lsmr
         GCiGuA9Pc+TJHCNh5c7fSY0rt/lPVAbBahhlGw7lr/tWhaOK+YN+5F2mSbuy2wK5sdoD
         AYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XP+5mGhuqYWyS6t2C4j6lLBTd4uy1YHWUAOZS/b8nWU=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=O+Z9CssSDRZ/fFeeQWigZ3CCFdkbXDRJBQdCeWui2oqNN+N7iekuOPJ4RBsNbIhtGf
         5yL1sUkfLHbWyUWIt7Oqilr/m9w7/rOlWmoLQbrpKqdy7x0LK7Z2zuZ94OAKOByPGWbF
         xGH4+aqMCKksYuMGfxA5HhNpyENpdp9e9/d/ZyyzYswfcwjmS08VQMbcrb+SI7oGgQ0o
         xuCS+IUsdGbnzKLcIK++vNCaP7gj3f6k4xCLcdE7hPsT4gidhUW1txy6rmQxLppWtslb
         cgmzGLGXwubWnSxyQKOlJO4VJ83L7bU8xwOMDaR3kzVgim1u/MieRgl+nXratACLWfFm
         64tA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780216805; x=1780821605; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP+5mGhuqYWyS6t2C4j6lLBTd4uy1YHWUAOZS/b8nWU=;
        b=bBLSA+8vmwPMYoLLx1SvrYCoPXJuUC+laOQyd9NgWvSTpt15pgias8dv1SF9Jtbiw3
         5MQ2CqN+QWgFMx1GVzdz7hnFY4q3oaBzKlKlY1EnvdvooLOXEeTZcH5UA+rNljYLxl70
         pTVGsNRtWLFtZRRWn27vH7qdHQ719h4AMX7H1dVOyEpMCrt6uYVIoc+i6raCNpPbU7X9
         cAMrqpFdScip9bahr6xcdn2tK5ZR+xWEUcru6njtxx8zY9ld1NXYzXRlgrg7kZgXEeT5
         vUF6VtL3+c+kG/Vf9HZSad8AyigPD6h4xV2gCqPPXr2CBoiDRFJt0gdm3whUKVimvxeV
         CRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780216805; x=1780821605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XP+5mGhuqYWyS6t2C4j6lLBTd4uy1YHWUAOZS/b8nWU=;
        b=IBAMceOiwcVF848oLw36z4y3xX3m0b/W1hUedJ4RT0HV9809iM29VqMbMqZz3h8qnT
         G77Cjw1HxWscu5MX7ZykSLWJp33kSWB8tpy/PuY/QNqaInhVR4l++dy0RT5T31JFJoa6
         7O212waWVBIjXuUvjrrEIRdUvb01/jkaWUikNuc2v69o9KQGNHypxaQjqQuFc7jomdUv
         wDhuiwBJh9dgZoHjFMk0qV6rEutC0xi1Le0ZgBNiUYQfNsSoLWU2bNZgPTmx56d/w74r
         AITPxsUXDNMrPl5UIGMFuZiV3Wxuq1aIw4C82rnHcQcFMa+1uAvQZzneaWJZEuB8YhmX
         2PLw==
X-Gm-Message-State: AOJu0YxdhZpTRKIZWpO2wLkVwpEgGpC770KZOT74d8OT8uspYKyNFsdN
	Lku+soGeKwA9IAx8tnIdNKsMr25QuzB/uJjw0T3fdsF6uC4tLfh/JJSaI3tHUDaY/i3sxAYSBFH
	2gZ9wLoM8uCBRHrol5/OKPwM3KaY7M2oLi+zhEsYP4kTI3qOPCefbI83FWNj6hw==
X-Gm-Gg: Acq92OGayPKlPqwIYatIaSwjNmOymBMkyIzaOeW5G6afC35VmTh9b7RCJ+qllLMou6u
	658FS5ox2huBg4/CWnN7pUy6vzUtEksEscupE0QHVopqy825Uj5Mrn3Ym301gLWbeVWHQA/mLqZ
	79K3FIAmLU6zLCfjA358mrVs+yVxpafQ8jLOCJGj6up9uVVxOSlEzvaBNkhQssflS0A1O9LtZBm
	V89NuR/yTUzrJ4RjC2QBm2Iv80iEEzrrtkSn2fYjR8K1vct/rtndDLpN6RKXGnXkJjLtUlXjl/L
	e+j70laiAmyQsM/WXlnZ+rWoV6utFlPWf2m/jXhPwN/V0gFiAkGkbqPb+jvsaOA5
X-Received: by 2002:a05:622a:602f:b0:516:3f51:81cb with SMTP id
 d75a77b69052e-5173c7c62admr9973511cf.13.1780216804875; Sun, 31 May 2026
 01:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260531075600.4058207-3-yuyanghuang@google.com> <20260531081909.B43831F00893@smtp.kernel.org>
In-Reply-To: <20260531081909.B43831F00893@smtp.kernel.org>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Sun, 31 May 2026 16:39:28 +0800
X-Gm-Features: AVHnY4KD0paNIVBC9uNyVFvRzOcbfSBNa0NzD8UXl-UeIELrmKSNma308t-9CmA
Message-ID: <CADXeF1GFXkh9bRPN1xs=OqVbg3pQpkh8p-aChjHsR3sNVrjPTg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: add verification for
 BPF_PROG_QUERY attr size boundaries
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 4:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: High]
> This is a pre-existing issue, but while this test checks if the revision
> field respects the buffer size limit, do the other fields actually respec=
t
> these boundaries?
>
> Looking at the BPF_PROG_QUERY command handlers, they appear to unconditio=
nally
> write to output fields without verifying if uattr_size is large enough to
> contain them, which could cause out-of-bounds writes in user space memory=
.
>
> For example, in kernel/bpf/cgroup.c:__cgroup_bpf_query():
>
>     if (copy_to_user(&uattr->query.attach_flags, &flags, sizeof(flags)))
>             return -EFAULT;
>     if (copy_to_user(&uattr->query.prog_cnt, &total_cnt, sizeof(total_cnt=
)))
>             return -EFAULT;
>
> These writes happen unconditionally regardless of the size passed.

attach_flags and prog_cnt should already have been present when
BPF_PROG_QUERY was introduced, so those places don't seem to have
backward compatibility issues.

>
> Furthermore, in kernel/bpf/syscall.c:bpf_prog_query(), the central
> dispatcher drops the uattr_size parameter entirely for almost all backend
> handlers:
>
>     case BPF_LIRC_MODE2:
>             return lirc_prog_query(attr, uattr);
>     case BPF_FLOW_DISSECTOR:
>     case BPF_SK_LOOKUP:
>             return netns_bpf_prog_query(attr, uattr);
>
> This means backends like bpf_mprog_query(), __netns_bpf_prog_query(), and
> sock_map_bpf_prog_query() never even receive uattr_size and unconditional=
ly
> call copy_to_user() on fields like attach_flags, prog_cnt, and count.
>
> If a user application calls bpf(BPF_PROG_QUERY, &attr, 4), which is only
> large enough for target_fd, would the kernel proceed to write multiple va=
lues
> past the end of the user's buffer, silently corrupting the process's stac=
k
> or heap?

Per the discussion in the previous review thread, the fix should be
minimal and limited to __cgroup_bpf_query only.
