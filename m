Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6D53AEB27
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 02:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045686; cv=none; b=gqJLCLya8GKymBv2xWmRfzbwyT2mpGKn+hqcJXoq0nQRJaEeb+UYyRG9IQK5IHH8E0VbLiDBKTv9mhgaYkx/IjRuc3OMlSu1XdJl4cpwh24JtiKFu/FNeGHKb7fuCmRyf76E97Lg5pckjugYm80ZNhxK+88MD2SWFzmPTQ4k1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045686; c=relaxed/simple;
	bh=aeyTWcs9E+uxhD5i9by9Aiw1/t/1P3Hmw+3P//Rf/j0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version; b=ZgUJtQVp1wM/8+6ZHQ9b4+4HKp2+iDZFXxgK89qRP3YzykXiVYo4eD4C0zlaw+z5xdbGehmFIalLTTmeChlX0uLAjHbYoGq60V1DzbTq658G3x6PU1CHYG6IMIDLAxTXYQwzsZAWwkpLfaWqGeK5qqwV/6ex0KAsnzk1Uc7MEig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+njk8pr; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+njk8pr"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so1534728a91.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 19:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045674; x=1790650474; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrryUBh0wA9y45vzn1E+3pGPW3cTDea6KxpezXzlJsE=;
        b=a+njk8prgf/fRA+1adMwWw4cbI7jD4n+kdaGrZiaEF8xHhftL0KcVaE7umhnEeoHD0
         f51I8gmDFwLvEBjUe6/HX4N61V1c/CsoVmWpdicRFQZuQr4KmeB+tLi3gV7ZthnqHpZt
         KxSCQUr3OpMInKCEZXyUUyZ8b+in4yfQIMqbnukVV4Cdz0Fq2WK1uD8Mwf2ph0vaQquZ
         oWMEKj+TzFvX8yfQubfd9D4OEbyvv8WNKYa536T+LSxvzN4Ohtgm80uFmHxl38M7VijP
         AQdTUB0eoQQqbv3Xtl+0yCwawssgCIDGAtu7EzwbtCbY3M529pP9YUE71SGma5cr4Rbc
         rlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045674; x=1790650474;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrryUBh0wA9y45vzn1E+3pGPW3cTDea6KxpezXzlJsE=;
        b=EuPrlkBbD2jJNJBRnSI29D1sxil39amFEp1fIUNWZiKDQ+091MswqJwrnqfTSU6Nx3
         Pz6QPNAig6TVS9pnmLdhrQDp2VMomUIv0vKS+x3UmrJ595OiYcbBLWSXPjcF6m8Y7h4Q
         zQ9GKaegPyP3CZwkg2S5cwKApowUEegSl4M2YUPbmlTfAx+j6neUBzQFWKicxS3cRx4N
         gvW2zjcYeKAKySvmACig4FX1zFZWnRqO/MaJO7BfznhJiuXdtJ/1luDTMWt54nSci5bU
         cb13mCEm93U2slx+xxgGkLtRhLnV7YZgKaYNIPHDTVXpBQ+9rdoBEVDnXadTftEiqweG
         TBtA==
X-Gm-Message-State: AFuF++l0AhnlWrPECS19DwWWiwGaQznB9aQksJUf9bjvqYkBFEHf4dO5
	XksBXZZMroWRBl5qFvqnZvkYshhDZrqDXPZIU9OIdPYa1CjOF+luXlhYqK4Mnw==
X-Gm-Gg: AYBFou05rKUBJzd5lFEC0lEuzmG7//oB3IiA8LVg3Lor1RS8twCVZOvIhfTxy5HUNr9
	rB5Jt/quGgNSGijAwnnh9TXXZibOBAxvXLNxw91I+ezSvXhZBAFyF9UFpzbWipzKzdr6zILFTeb
	Oj+wCp/TBAW+LdQYUF3vp37z0wyyfEnDgvKNI7zOqyr7ACDYhMVyAHV/5lM1I2D/dXcdBAEAtH9
	gelCuehCuUSt3Q95ORteSIy9xZP+X57g6yjL4TBv+MAMXk/u/Z0+QRgJajTi+xCNKeY36Y9FZit
	abug659LKvgk+Uy656GSOCxWfJyjUVh1yaz//lqUykeX2XkPPNHz9Y+bxXSrNeid+msqQrXM5so
	SMGA76l5xu+Fr6/N6sWcabDEtUXWls2Z6mCFm7fZaYcajYK7GjYUPhTfUN3q4eac7/a6CqOxW5U
	y4UPeg/Z/LNU/8d8I7XmP0yk5gh15buRl6KDsAjvxJGMSzbm+wyIWWDBVglank7lZUTE8fIj4Om
	mpcNuXQiqlidVcToxRTUPpiyaI/a/uLsx9SEyE+7eWQRfPGAPE81KWlmNmnggeDtQ0ecoStk2hl
	Bhc=
X-Received: by 2002:a17:90b:3e85:b0:39e:3baa:bd3a with SMTP id 98e67ed59e1d1-39e54dca2fbmr18001286a91.12.1790045674245;
        Mon, 21 Sep 2026 19:54:34 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06cb2b46csm303914a91.3.2026.09.21.19.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 19:54:33 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 02:54:33 +0000
Message-Id: <DLLI8DZ44BSN.35MO12IZJET8H@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next 06/17] bpf: Add callx calls to the call graph
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20260922012711.C2F581F000FF@smtp.kernel.org>
References: <20260922011323.1298619-1-alexei.starovoitov@gmail.com> <20260922011323.1298619-7-alexei.starovoitov@gmail.com> <20260922012711.C2F581F000FF@smtp.kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 01:27 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +		if (bpf_is_callx(insn + i)) {
>> +			/*
>> +			 * Walk the callees recorded by the main verification
>> +			 * pass one by one, returning to this insn after each.
>> +			 */
>> +			if (dinfo[idx].callx_insn != i) {
>> +				dinfo[idx].callx_insn = i;
>> +				dinfo[idx].callx_next = 0;
>> +			}
>> +			sidx = next_callx_callee(env, idx, dinfo[idx].callx_next);
>
> [Severity: High]
> Could this lead to a quadratic path explosion and unbounded CPU time in the
> verifier?
>
> The callx_edges bitmap appears to aggregate all distinct callees for an
> entire caller subprogram. If I am reading this correctly,
> check_max_stack_depth_subprog iterates over this entire aggregate bitmap
> for every single callx instruction in that subprogram.
>
> If a subprogram has K callx instructions and M distinct callees, would the
> verifier evaluate K * M edges here instead of just K edges? Across nested
> subprogram calls, it seems like this combinatorial amplification could
> evaluate paths exponentially. Since this pass lacks state pruning or
> complexity bounds, could this bypass the verifier complexity limits and hang
> the kernel thread?

Not a bug. K * M is intentional. The edges are recorded per caller,
not per insn.
