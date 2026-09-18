Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C26E50B433
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746521; cv=none; b=nidywIe1oHGwDzCLMV0SmG6tcTsqUccNC5fie80sbtrab0hs+cTQIS8sKTi5hob+1RZlkid6Rae45OPTLgaXYHLPp8/BJnxlmuGvIEUNGEHdUu1YBD8DnvnbVjNqeUK7UPmEdiuf4N70HccbJLUjQ3oVZNCr99QVUHFBKqGLgXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746521; c=relaxed/simple;
	bh=DCEr206mu1fTBop+5gRQZ8IwHub77AxoSPqpcC21zvQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qBR0tGGBU7BiCXQaxc0OCTopk58ChEKiAwhtXN+KktgGxoF0qSk9pB4sGecMny2UJM0fyfoMZaozurMIOkfdJO2/lyTz493sq/nu41KG+yCVIAwaK4U2OTESRmkLBGApUK2V+1Qefw3s2yxjIgYufU6vlH/TSruvl58nWSuoZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=D1NdvR9B; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="D1NdvR9B"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb76bcb1eso10216101cf.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789746518; x=1790351318; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DCEr206mu1fTBop+5gRQZ8IwHub77AxoSPqpcC21zvQ=;
        b=D1NdvR9BsGYxyDfmrwEO3fKG6lqlHnZG/gxPWqtB+vWRk/WDDW+hLzas9CV5FUrxc5
         3YiIhgCg4VtpUCtNMEUWfw5GtwCT9irSbywNDFP05XqEMlzCXSP8wvVkfCauf/DswGZv
         Oyd8akvEXELQpuVydd/sRwQW4+xnvCm++TWdvgUyWPHGmtuxeroXcSL45VqbtM50luMW
         k4feuYAvPUJVJQbN/ZsC7r/ECeBb3IodEVN9Cd+XQ2Y2F5ykAO0pCxG0Ii3mNGaXm5Sf
         4CbmoHyNg4rIzWZs8SgK9IAvRtHz3gW5v3hKpl653AZT3bBt2nuwOZa2bBEVmhYDc+bL
         K59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789746518; x=1790351318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCEr206mu1fTBop+5gRQZ8IwHub77AxoSPqpcC21zvQ=;
        b=2Ep/dQ6n58VYHkBtKyiYsrmKz/VZHUDq5AkoeqkfTTWIiUfM7drWalsKmGAEobKNX1
         BQ9c1Xn8/olN3H0ohHtkfKia15d/oH26PPVr3gHxh30LNaZeqBQGM/VcxaA6rl3FbZ50
         YGDG4UZl+CmqdzmYGsl4wD0oDjBgl3Xnk6Gg7xxM5fXNOlGwo24JEM8sfDMqhetB7wO3
         ZmKY6Izsi0It1TuaJ7hm8BteQUYo8AYjOQWeadANXM4dZjZ4M3ZYmhPq1fQB1vZzLHne
         V2EIjV1N4euD5Pg71zkAW7K4jE94uDH8bPj6HcIasVi5Y1vpUjTTuToo/N676t8ywfrP
         aYzw==
X-Gm-Message-State: AFuF++my4yVze7bcbNqXU+m4oZ7G4pnf5941auDOwfSdYlPNoaB8QqFi
	8Xf1LlMk1LeP22tdCjarh7cyRg5L0ZM0CzcN7VtbMuEN1EBPTuM/PVbH3EC8OeC11OYyn5o1WsF
	m/rp2
X-Gm-Gg: AYBFou0bzU+h70co/S5bc+2jgAJXHQiIVggD6kzPFqsC+M9wHskWC5Qwqu9CEBi1Jhg
	t36B869CnOtQwUbcMvGBTV5Nh/o+AMHrrqTnGssA6jbuGFiS4BXtHKYpxkoSCpUT08MaY/nGVve
	6mI1o2qCXF1l7EfpcI/tnfh+5AmL85qqu6mx3g85IDwQ13j6LURD0RjPkxIo9oWUOOeojsb2Cj8
	NrS4Fn9AbDrD5SqwJjFFTgZjES+NNLVn9d2JWCM/YmhJgbvbQRpBj1uJacCrIrrIwghdNz2CT0H
	O/7bSGMKeiuFuHUk3TaKQw3+226e9uiLaj7dFMoM0fwZnHLJ53f4EdkIB7zSD12wvMVrKTDE7tD
	AHVTmkNjyWXSe/BuKh4nhRoeRmdYSbXvNV6oL5c30RnQ0xmh1OyJdrxNQvSZiLe/ccTlW5W8UgL
	Y79QPGKDa++O7QxtaT1ooD8v7aK6D45Zu6EDksuHUmVJj48HrHrEWd3Zm3RgEHC4IWMu99cNlsC
	87dgmxeoQ2Rpum0A2P0TdEg8KLcn/SU58KGlbJ6FK+S+gG/FhG/WBaADPLACY3JVfs=
X-Received: by 2002:a05:620a:2795:b0:939:6de8:43dd with SMTP id af79cd13be357-93bdc9fd82amr447343685a.49.1789746518332;
        Fri, 18 Sep 2026 08:48:38 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0ccabecsm172276485a.6.2026.09.18.08.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:48:37 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:48:20 +0000
Message-ID: <adc0426b5f4c8137c1f97d7b148d7adb.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH RFC v4 02/13] rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines
In-Reply-To: <20260918151031.2E0941F000FF@smtp.kernel.org>
References: <20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com> <20260918-b4-rcu-tasks-preempt-qs-v4-2-63f0e9d69661@toxicpanda.com> <20260918151031.2E0941F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 15:10:30 +0000, sashiko-bot@kernel.org wrote:
> However, the per-cpu rtp_exit_list list head cannot be statically
> initialized and is dynamically initialized via cblist_init_generic() from
> a core_initcall. Since core_initcalls are executed much later by the
> kernel_init thread, any preemption before that phase will attempt to
> list_add() to a zero-initialized (null) rtp_exit_list.

No, cblist_init_generic() is not run from the core_initcall. It is run
from rcu_init() -> tasks_cblist_init_generic(), which start_kernel()
calls with interrupts still disabled (the function asserts as much) and
well before its local_irq_enable(). The core_initcall only spawns the
grace-period kthread. So the per-CPU rtp_exit_list heads exist before
the first interrupt can be taken, let alone an irq-exit preemption; the
classic flavor's exit_tasks_rcu_start() already depends on the same
ordering for the same list.

Thanks,

Josef
