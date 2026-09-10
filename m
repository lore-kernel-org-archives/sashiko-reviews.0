Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0FC330328
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 22:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789080405; cv=none; b=RPBe2+EF4H8FphprndwGrlL5z98jfev0dNoWtqzhjbFgL+ep5nwXhnBAQLcy3TnhW2Yrtq1CRegdibUeThmQ6MoJ/JxGNIOWzh9Bz8Qm+jckfWpMSiOd/U+pJg7GstOumX1IGZUn8PciF5HyxTUXv13Umm+7K1IQGib5Etj7UzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789080405; c=relaxed/simple;
	bh=SVUpaxhc/WIBfNSCedhE5+nKIJK1oRK66sf/5MKTEmI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ret+A++KE7PWp9saDIkdf+5IL/4N/rgVklyrJMfQ6TDW3cPlLGhLdTbUcdSHF7f1fOb77AxZQ7Q3OmTDm0QfnTCM6btS6M7+LBXAHqHn2doECfup1KmPstt56SaOBWl6hylPYLyQjS+An0YZDsWa/7a3xSNORXMQSn0MjezB6r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=dG7bTAbD; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="dG7bTAbD"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9120eda2195so4624696d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 15:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789080402; x=1789685202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GBU7hvidTKCJV2Nv+RIrUVUgoddYnQKNG/JROhtpIDU=;
        b=dG7bTAbDTZLSnUq9iZ0wv1YTZsMO8NxMKpk7JbQBBG5fRQAXKKtXB4RbJnIlEjaOE1
         w7cRxFrx0vJ2eomMcjEvpGmazzRXE6hxjNBr/BPJfTP7c397rio6Av0jBx1AkHrLlSiV
         I6ngNSh+ID7OzjlPJJLeQIovFONENSqpsxo48zSZp+VylzyNeg6/1ok42hQxtY2PWLaA
         tx+Aqhe6NzHt124hgZcM4DIb4u9qSQE6WXCL4Mur9XTuCYuMAwA5OX+UQLCRoOSBun4+
         6AReUV1P4xInLs7WUUuI1LdqP4q2NTq1Uq6VC4B6MslBFtMOU+wgJex/1embPL+VuPh/
         baSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789080402; x=1789685202;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBU7hvidTKCJV2Nv+RIrUVUgoddYnQKNG/JROhtpIDU=;
        b=fhjwoP91YljWwzH2IgsjX1yMvwS0TFwMpHphCxJQxVTgwAzcz+gd/4yJv3q1TgRvLE
         lebjlUEOBP/vKPyha6OeZ00M6GmKEIRCVl1f2GBKA4OcUkdrZB84JFsgz/TnetUWCCA4
         cJ1igwFVGxV5LP23g87GRqZIzhApH0U8FBRZKouySiawu1q3pzkxXQQySPg2yk+3GahE
         5CyJO90sSoGsC2/W9AtA0dmkx85GUIygwes5m0uFJzLBvf9FTIkMI9hBXMaUTU/dJPbc
         PiRu5ouM22h6ufFgKfyKxOD6+kpOMntxOHu/hoJpTaER7tD11tOV98MCRghOEdpLc2U5
         TYcg==
X-Gm-Message-State: AFuF++nz4iNjanzwRtuRo/WvzY20j70wkOpi+78JNNvGexne2u8XdIkJ
	nObrMDLbhJH9HR6BoXeX07mmkmxp88JCRe4DMzV4hdQ0QS4lHZ/XqGmBFdzfpM/mvFlhIOPNqaJ
	hyXao
X-Gm-Gg: AYBFou0/3Vmm0nTDrjIgDZrphG1QttQQuYdtK2xuIprNgR1VeRHrsAshMocrwNkUJSh
	MCgS/7Ae0hkpRPda2Q5XrtVS4vvFP+oxGbxfedEkFd4BIcevH+hkvKZGPi01xpFAt1kGRP03ifF
	Fy+1HOl4qz3k92rETO6OvMaN6AhKj6hQwtF8JnT0JEGZCGNeJjCkFGf5OipaXHBLG9ijPodaD2X
	50VOUspiNzaTaOAXqvi9/po6xx6XOG1+ozQ2OE1QrGM9IZemCWcg7QNDGqUqBN0bP/9rI9/e5k/
	XHGRWd/n4kvLtzClgFsGcNpYdxocg8AzxJqwwif+szasGl5XC5Z3wKrPYFv/B9e+FhNq7l5LvbI
	4k63GnQnj2YucrKFDVfH4VgL5y2WJnj8Sr+1CUnLLboo7JhpczOsA+4mY8dQ9kP69pHatrilEJR
	NSyxvVoAhrkwZbBGFUtagwJnIno0b2ytFWRRmjgbC0gH/FZv+7qldUE4HbHHMi7p9Hc4n5nf6jZ
	hjXjFfp4UD6N7+fRnCXg+3RN82ZiCywaGdCH5JFsi01JuASd/zzJTdM28GIs4EDg1I=
X-Received: by 2002:a05:620a:3182:b0:939:75b2:8844 with SMTP id af79cd13be357-939d7fcb1a2mr822789185a.35.1789080401713;
        Thu, 10 Sep 2026 15:46:41 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e809fd0bsm91246585a.33.2026.09.10.15.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:46:41 -0700 (PDT)
Date: Thu, 10 Sep 2026 22:46:38 +0000
Message-ID: <e44411503b3696cdf003d3e46bc54fc6.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH RFC 09/13] arm64: ftrace: Maintain Tasks RCU trampoline nesting in ftrace_caller
In-Reply-To: <20260910190436.EBE3A1F000FF@smtp.kernel.org>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com> <20260910-b4-rcu-tasks-preempt-qs-v1-9-d4469f4cc101@toxicpanda.com> <20260910190436.EBE3A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 19:04:36 +0000, sashiko-bot@kernel.org wrote:
> > +/* End of [ftrace_caller, ...) for arch_rcu_tasks_ip_in_trampoline(). */
> > +SYM_CODE_START(ftrace_static_tramp_end)
> > +SYM_CODE_END(ftrace_static_tramp_end)
> > +
> >  #else /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
>
> [Severity: Low]
> Will this cause a linker error when compiling with
> CONFIG_RCU_TASKS_PREEMPT_QS=y but CONFIG_DYNAMIC_FTRACE_WITH_ARGS=n?

No, that configuration cannot exist. CONFIG_RCU_TASKS_PREEMPT_QS is
def_bool on ARCH_HAS_RCU_TASKS_PREEMPT_QS, and the only place arm64 sets
that is in patch 13:

	select ARCH_HAS_RCU_TASKS_PREEMPT_QS if DYNAMIC_FTRACE_WITH_ARGS

so on arm64 RCU_TASKS_PREEMPT_QS=y implies DYNAMIC_FTRACE_WITH_ARGS=y and
both the marker in entry-ftrace.S and the arch_rcu_tasks_ip_in_trampoline()
that references it are built together or not at all. At this point in the
series (patch 9) nothing selects the option yet, so the reference is not
built either.

For the tool: the two symbols are tied by a Kconfig dependency introduced
later in the same series; checking the select conditions across the
series would have avoided this one. No change for v2 beyond a note in the
changelog.

Thanks,

Josef
