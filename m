Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B646EC77
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 13:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786844; cv=none; b=YX/dajm89m9tZKJ2uoQ9q9E+5OHkiBQKVODr9RxHPGiRDkaBVJDfvbaJJ/GZt2D+ehzoFFHXbDKuPakhdTp6bjl8w2IaOJ/D8gIS9gcC3oHPpuV0zRy6TGkbK/TKPjXd5RGgrlg0V3z1N7NDLxW6CZ9eYPO2NaQWEOwwuZ97GvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786844; c=relaxed/simple;
	bh=U/K1TM87MGaUzxHbH+OVtkemYc8EIpNWLBeSJAGJLME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fN80NwOAwPoXDuL1TieLoqDH4IEcUXA0oCZJzM475msi4evJgYgYAhUpMb+KwMshP3LgxD7mYyugiaOEmHBB7K/Ef73jJSb02f1w2qpIzWJ4Ct2R1mCK4cvVmCH9pPjr72LL8bndG+yMIv2OMqYgUwNDVVoOcgVwshbSO11wM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QC4rgalk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QC4rgalk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84ea0ded155so56721b3a.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786837; x=1789391637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4AAG40LTRoPDYyIeHaDyg92sdqewT/vjBha2Pue4bw=;
        b=QC4rgalkb0N8WSGNO1l1CbA+fh6N4BLKVn6Be+mN+Dh+7/PrTyV1L/7rjDyKC/j+3/
         j6CNiQOs+hIrVspbIHzxlOBnhHiiDUZYpBgoDhkchCJz6/2Yk390cDXWrvJoWL2nXcL5
         lt3VV4zpPtHAuEZ+EemxNVzWh24v4R41P3mHwF1/YW1mZu6rkJ2lovVBInSfSlwnXW3G
         kOijRe2bsG+U0IthsICqrvpVOq1EoqzPhcSd2uowN5CzLYQmD3Ne/4L3PkVUCscAhSpx
         Ej5GG86JxuZgbczvORPGRSvQ4lEWlklioTHuI8rftqXhBd5EG04NYQJkzcAMuV287F94
         IV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786837; x=1789391637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4AAG40LTRoPDYyIeHaDyg92sdqewT/vjBha2Pue4bw=;
        b=Mm8KuGkM5gifsLFvjhoB/+7/0sVKszSw5UwjAKPWerE5iSrjft9QvKhqIv9JBY/FCZ
         8OW6xYo6xZyuW3ym6nbDtXPSZ7B9vLERiJEpVHKfhs4VPdHCs7jZstdlxfB25Uh021/7
         tR9sSM1w8QBRgMMfNXB4bEpiFiioBUCLf3+alHr4LfrTrAQi0Cg/rOozVdTSPvNt4+wv
         GLk+90BbyOJbDFqDWIghMs9zMfPMfrRAh2r6aySl1Yjlw5zaHQPpP+aWjvqlWbLaEYbB
         rlrQKsK2uiCin0O1DrDRv+EP1FUlPLjjtwrwJs8chuFOzNq75nfktYP/Lsst717fnl6E
         j4jg==
X-Gm-Message-State: AFuF++kNWSysvK89bRsUeCZEpiSS8UIbEtOgBrTQGPczc22Z+K41h3fy
	R4uHBpkP88IdaSmkd2tG3Pcpsw0NtGyDy1Nkymx4+KRIbqSMMZfgLYUe6sS5dAc=
X-Gm-Gg: AYBFou0vXJ/HcsRXIjMQA0ddUmOO98gwSQ+F9ERFBha+g21Y2/sTljo9ZSj4aqra2z9
	JYYkJK9/WUpkJVqwx3QXlNo8skzirz2I3FZynTrMuAUhm8Q6sAoYS+XYvQVtMRMtYT1q4HYCSEs
	pY28p0CwkTEHD7gi5ZPdgsxKVZCF5rfpdZ5OAAHwUfBB3VP+PLRpNEtwQs/yKSe3LW6QcoFue6U
	weWHI78n0nYJ2Nkzshm9/d4ZozuuIeUtK0nmVR6ySRDeaYd+UdAOOFBl8122x7yLrxdJBgcVTXo
	LVBBgYGzX4jsVWrETiMFuPsjXDhQNlUGqPescuIDodgVIK2fb7jOk2uGghpoF3koj7sZ3IclbCy
	BY510q94v2AWKtzzI0VFu2GsmtAGc2Czlg2SaP8ZkDcQk8QZZfx/vc6gL1GCYX9NULzgR9mfMXi
	0r9EG5DDV0Z6yc1/LmozRwoJE1hrCEeyP90lQ1H81IekZHJNZ9I4mSGZtB7L8KzGO/RLSo513IW
	saTz8EEbNS9bzqI
X-Received: by 2002:a05:6a00:8015:b0:857:4dea:e2fe with SMTP id d2e1a72fcca58-8616b26f4a8mr32915798b3a.13.1788786836830;
        Mon, 07 Sep 2026 06:13:56 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153e3ac30sm4343157b3a.56.2026.09.07.06.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:13:56 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH 1/2] tracing: hist: take the reference before publishing the named trigger
Date: Mon,  7 Sep 2026 22:13:51 +0900
Message-ID: <20260907131351.613525-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907125934.5C6261F00A3E@smtp.kernel.org>
References: <20260907124420.607097-2-donggeunyoo.kernel@gmail.com> <20260907125934.5C6261F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 12:59:33PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but does this fix leave another
> identical use-after-free and memory leak reachable from tracefs?
>
> If trigger registration fails in hist_register_trigger() after this .init()
> function succeeds, the error propagates up without undoing it:

Yes, and that one is already fixed. tracing_set_clock() is the only step
in hist_register_trigger() that can fail after cmd_ops->init(), and this:

  https://lore.kernel.org/linux-trace-kernel/20260907091415.554535-1-donggeunyoo.kernel@gmail.com/

moves it above the init, so nothing which can fail runs after the trigger
is published. This series is based on v7.3-rc2, without that patch.

> [Severity: Medium]
> This is a pre-existing issue, but does ignoring the return value of
> save_named_trigger() break histogram sharing?

Yes. On a kstrdup() failure the trigger keeps running with data->name
NULL and off the list, so find_named_trigger() cannot see it, a later
trigger of the same name builds its own map instead of sharing, and
pause_named_trigger() misses it.

Memory safety is not affected. trigger_data_alloc() runs
INIT_LIST_HEAD(&trigger_data->named_list), so the unconditional
del_named_trigger() in event_hist_trigger_named_free() deletes a
self-linked entry and kfree()s a NULL name.

Not addressed by this series.
