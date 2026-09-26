Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B7635200D
	for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790410885; cv=none; b=NWl7gp4L7GcpRHD05aHgZy2WaOpaVaVM0rGIgM5hIbA3uOXjki5ec12cweZ0A0njotTgFbIxmLdkdtmN+89FX6WP6cZ4QqnAIwjxOjxDwvnCQSrZPhMltH9ZeAm7U8nUiNKzv4NwwU1rq3UsUBUn8otn2TdOdXuqiWahuZQXLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790410885; c=relaxed/simple;
	bh=qP8vtPntjjcfMQBg2lXZDIYewaoQ72Fmh0mP130JmD8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Dxa7jxcThX5yv9nr3Aik69692AQ8X+FdGVL9x3fwxrfYskS+QuMNwmSqObvUpn+Vgg/b/3Zo5j1CjO6w/HfmsAFq5RyQLuACHsuoxHoZ/XiQtnHjagmKc6bvoOO06lQyHLd2l3BkGEuAUWrOPes+Gvcizx5M4xdkteTiB3WErvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msdRhZ7h; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msdRhZ7h"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so542888a91.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 26 Sep 2026 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790410882; x=1791015682; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qP8vtPntjjcfMQBg2lXZDIYewaoQ72Fmh0mP130JmD8=;
        b=msdRhZ7hOF8YiIJxKYDzKmPx5jThBpoUCfz0gaLMp4mbBxCfC+TaNBmrfxrDMKHUrS
         nwmS5ruaxnHjRjb3oIYjwj0AYmU+gpT6umRhQgihWgNDDtFnPDLGvXyXCH0Hpo+cwVk1
         4BV520MwB7QA5YuRguOCztuSYHeEOxDFcoJWdl/WIT+UsWy5YpLlXLFC69/kF4uNhDDd
         tE4ZzxwEsLi7x+sY6XzaebaiWTurd8wVZ6fyIQzkxkjq2zhmJWw1bqd/jw4Pz3LAA4W4
         hCOuZUWiia7E1lPSnldVt+PSUb3zCYI/orohAAbYGWmVXRuzJABrxmmsXaOtcSYb1CpF
         uCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790410882; x=1791015682;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qP8vtPntjjcfMQBg2lXZDIYewaoQ72Fmh0mP130JmD8=;
        b=RUH2Br8YHOmEvdwr/Y/HsB1atUO39faeslBGD7dvgnt/7wmpjDXFPbmgfVpZF4He5k
         kXP9CuOF18jR7VyGqQhhWJ0vq2S9EZGXSGPuA4z1mvsSmrMkMYz2WTR7MV2hn88Q0l0s
         clBtXo6rMyONMKS0YXV3C6+Ju4uc+PQ5EvN3mWzXw5zIS/87SErPCY6PhOw2W6/dvghh
         SshYnbUohJazsi5DdKU6aAbLaqBSq6QdbzCNwY+mQ4yZuLy85bqcIkkyxhIESuvfERpS
         ArHWYpvjyGnmgY+geXHQVLJcdYAgLi2Zc6SAgw60OjYQQz7HHwqVxFWLpLBbFsiHL3JQ
         ttsw==
X-Gm-Message-State: AFq9FYKhGWow/sxcQ73z9TtUGlITfsDVegI8p9E6g4LWwARIU8dBZMdT
	saQMX//Ow2PTMvkC8YUAhpwIvbJTIsz6T6jaQGuuQyr++zfcocaCxeFhtwkSDwq60Fk=
X-Gm-Gg: AYBFou1cVtxRU1Pi+V5LpVdXxzeB9zqESlz6dKl9V87JacVpL3pkLqa9+1GyX3p8c0P
	wCNmEtz8V6L6wQA7zuZSTOhvJsCS+69GLEkUGwObwXcFRAtucXRBjxQ1ckEbaKza+w6Rq77thk7
	0oTzKcdJvIjRZKQwVwB57edknWr+PJ+bVeS3+M+CI0SVOJu6twHYXvpreLvEJNUtxmbUZE4wgRT
	W0w14QsQqZ8VcVj2fqkmq4k61CKH+mYjbAnUa4rpFaVPvBBPgjeyR/ZFieT9wa2VCUhhKEx2384
	A6EDmHJ9cXeQVEAB1iNpYouFDOJA8r9r9FWZQHlzMZzOW4yU4ZjkPbTXTpx7LAtgXKjqHe0yO+h
	w7rAvFVYu/7WhOtkjJyHP4WtdkCbPOgN+5O/xHo77ZBPAuMEwZvimwphnljYddRXbqnqiZWKoeU
	YxIudb9dnFFZbqYRvNO5U3Rxo7Y3tmF976VpnOWuBe1ou1h4nHhnWfsFNAmAqfRNoyyRYXXYUQe
	UUtC3T7lfRCSVfszndcG9eIr7qCXTF+Ms6tS4pXlZF/FgNnxo3j8V9yNjeaLiQcQKuMDOkJcwp3
	A1w=
X-Received: by 2002:a17:90b:4e86:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3a098b8addcmr6306044a91.29.1790410881813;
        Sat, 26 Sep 2026 01:21:21 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm16374836a91.4.2026.09.26.01.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 01:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 08:21:19 +0000
Message-Id: <DLP3OR7UHWTG.12NVK9OML0YZX@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v6 07/21] bpf: Resume a covered call at its
 landing pad
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Yonghong Song"
 <yonghong.song@linux.dev>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260926050006.2213110-1-yonghong.song@linux.dev>
 <20260926050042.2216692-1-yonghong.song@linux.dev>
 <20260926051542.D2B111F00893@smtp.kernel.org>
In-Reply-To: <20260926051542.D2B111F00893@smtp.kernel.org>

On Sat Sep 26, 2026 at 5:15 AM UTC, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] bpf: verifier bypass of resource leaks on unwinding without pad
> - [High] bpf: double free via bpf_unwind_resume returning to normal path =
in verifier
> - [Medium] bpf: precision tracking corruption when backtracking through b=
pf_unwind_resume
> - [Medium] bpf: CFG and liveness graph mismatch for bpf_unwind_resume

These and other bot findings look real.
Please tell your clanker to look for bugs harder.
sashiko shouldn't be finding such severe bugs.

pw-bot: cr
