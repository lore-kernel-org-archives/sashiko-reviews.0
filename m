Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153714;
	b=LP8wCPDpoQnLwpP3usqqRGEX0A8ODwyG52jy/6rY4cJBz/z3E0nVLrql3Insh6mXhKhH
	 gqHuVb3sptndj2hRZfrN14UAh1vbP/pCOOJgvQSvASO4eBIU/BaNB0aaGIOQ+CAwONdEj
	 t5R0BMTT/3XygC53plDo4aKkEMwfvCzTMlN4Bx5DHs7hVI8tRJ1QV5bySzHhbangNPSmp
	 HisqNraOEfsygh/vdcQzdnf5s7/3gtt0vsz4YVesU7q3xV4ofowOM0I1ysQSjjqSdZ/3d
	 HYNJcznxCTWeqp29++OFMp03NIR3UcXEQuGNPdlhvNSUUc5eTaPmqmIHBXPQRzh088g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=QEFa3ES2OKY+dQxu3wHCuZVbSvWZ06o3OO4Y2BDdtZQ=;
	b=HdD1q2feRCopTwOHLcF9zlm8W2aHtpXGBSpVL0nLIWQRcb219AYm0bKG1yi60JxK9sFg
	 Fj9zPSuXquujCRZW1lx/iRFoLofGmLrVKSTrwT0yw/NxPLeH6rHHNgxmQCUuIDmTRgSXf
	 AmAckuw1+qsOK+FPocDzA7sZVStLDD0+vnLHFUukwq/24+TWSTzypREeI2h9CI6G2Vfn/
	 lwR64RrB1ob2f00BCTAfcoBe7m39BbqZKY1ZkE5DJiqsPpBOLktxYpNAPr6rDhTA8Whn+
	 IR6xY2OnPshahqxW+RVxR1EXHz5mrvtpTzifJmdJSGzjU3yWncluFn/iiCN35PcDTmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eHDIGf/P";
	arc=none smtp.remote-ip=74.125.225.128
Received: from mail-wm2-f0.google.com (mail-wm2-f0.google.com [74.125.225.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF6606A330
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 02:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FF6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eHDIGf/P
Received: by mail-wm2-f0.google.com with SMTP id 5b1f17b1804b1-4a2d6cf8c98so1007185e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153712; x=1793758512; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QEFa3ES2OKY+dQxu3wHCuZVbSvWZ06o3OO4Y2BDdtZQ=;
        b=eHDIGf/PeG2xueZqRoueQp7X0fXrptlIspVaPCvqGusTZ+QVNfmW0YLzLVGwGcIJdY
         US2Wn3Gp/ssIaNxViyWth8Kl1GSjWMMfa+LhFRPXTypXhaYvn+7c33YJDEDchuzXDsMk
         i4byRUEEpl5L8plmw3JUPrVBy0x6DEMsHRnM0Q3Pj/KIBNzhY8dhpO/88EMVb5m+5vDU
         T/7SXWtUikmcIXRP+L2vw9IsCNQcFvfh4sd7KqI2sbj4jKOQIRPUnYckU/3TNr3nbe6p
         9/lONSL13Nitrsl2PQbP0PZUZv/9mvJh1DJkTovd5d1P6YI6NfEev+jscD325c3q/xqb
         XP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153712; x=1793758512;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QEFa3ES2OKY+dQxu3wHCuZVbSvWZ06o3OO4Y2BDdtZQ=;
        b=HGVSdoBzu90a2hmt65rYcxyzmgLZDj3xzDdUfbB1GihQDeiQvOHq2AGLXO/x8LUvg5
         MnxepH12gkn8i/D4il+no709ozV+l5IDj3kurwaq7q4/GzNBhWnQXBqDmr1cd0bcPSZB
         bh1WettRtu3zYoad1ETu4426m0LGFm5f9bBsHEh3VHfo9Rz1KbwePyQdVMLKmmmywpBT
         scvrXA9e1bAwGzr6ub42K3SzSWS38vi8N3HmdUtEPTnb6A27FeM2heDHi6NIjvr1Z4t5
         Iebajru3eEvlyw2FB50I362bvFIYORU1tpLqstV7weozrJ3w75SN5wcn4hZ330iOdnL0
         wKow==
X-Gm-Message-State: AFq9FYJct4B8WXBgkclCspBVES3Q0K/BNiPeM9YZ6zkiHD6GrVEJ1HuX
	5dLdpBPlXO5TpIGqdtDvzJaMgUePcShlBHMZa+nSlxLB1Yi68DNl150aRz7aY8S5
X-Gm-Gg: AYBFou0gNd9bI4UT25Jrh2klkoMgoZ68vVMt+BMXr4zdcW+J5Rw+x0jd1Uh7TCEMhdU
	x5Fad/2gY+tXjO7zsfoY2OeEeOZttLmmizBkmUg96fBGMXo0CYob+r4AiWmPIcY9E8UXCMcHSeQ
	oczJ+UNnzRmqTcq11PzIHRfsz5//XkpxTyZvGJLFJePUi0HVmDtHrYEROrStv335EljEo9F67L6
	Xsxpr9YtO6GED6wgry2npBjz9XKJno49ZrYxvrfVv4yaqczshVBydBxb6DZh2FWYezbFyC1bqqe
	q/5vAeHM4HXaGpvNi1PdTshrn5MP0WTEnfQezrxocomqL6Hq+AyMcQo4G11kkvir+4bKHlWubbY
	ILoB59mQu09DLOxCE6lmLogUVxydGqlJhI6cXZSeSbq2kjTvIncrsptNxnrLCY3fcn2zr2Ha9VB
	DuasaGNlG5sgBkj0C4OlUfbcR79QQll29IP/2ie2+YKlUg4MwLRJH7um5xY0dpD1O36lzCOip0i
	70o3eH3AM9g0kHjdIV2pnEy+l3CyOBoF6TKmlKK70FXP4JMJhbELtIYlBSMDJIuXswL3Vouy1lM
	Oqztv+jjWfcxgFnlhoH0Vhe6GFazemOC0uPP2kl1mRQqYsPD7mKwgg4NyNVgdowLDQnciMaGr+Q
	VB8aApB9f627kRS8p9kMZFbJBy4O6wdgBZichHzhJ35PKNK37TnEaL85+3mLg0RKZmpzDpDvbtD
	sdgh3dYIT2Oh+qt+Y=
X-Received: by 2002:a05:6000:616:b0:48e:5c60:6a3b with SMTP id ffacd0b85a97d-48e5d5dfd9emr2512645f8f.46.1793153712200;
        Tue, 27 Oct 2026 19:15:12 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm26800381f8f.11.2026.10.27.19.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:15:11 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [RFC PATCH bpf-next v1 03/11] bpf: Let a callback unwind into the pad of its helper
Date: Wed, 28 Oct 2026 03:15:11 +0100
Message-ID: <20261028021511.1203900-3-memxor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-187317@kernel.org>
References: <cover.1793147364.git.memxor@gmail.com> <cc848a0c0e4839fe34514b89561884c082650881.1793147364.git.memxor@gmail.com> <sashiko-outbox-187317@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed Oct 28, 2026 at 2:31 AM CET, sashiko-bot wrote:
> [...]
> [Severity: Medium]
> What happens when unwind_goto follows a call to bpf_loop() that gets inlined
> by bpf_optimize_bpf_loop() -> inline_bpf_loop(), but the callback does not
> unwind (!env->subprog_info[subprog].can_unwind)?

The next version turns the unwind_goto after the call of bpf_loop() into
a no-op jump whether or not the inlined loop gets a pad, so it never
follows the last insn of the loop, and the loop gets a pad only when the
verifier saw the pad of the caller: with a loop of no rounds that pad is
dead and goes with the dead code.

> [...]
> [Severity: High]
> Can a callback with a 9..16 byte BTF return type clobber the caller's R2
> argument register when it exits via unwind_exit?

Right. The pad of a helper carries r0 alone, so a callback hands over r0
alone in the next version, whatever its prototype says.

> [...]
> [Severity: Medium]
> Can revisiting the call instruction with state->unwound set trigger
> verifier_bug_if() in do_check()'s precomputed constant register check?

Right. The revisit carries the r0 of the callback, so r0 is no constant
of such an insn: bpf_compute_const_regs() skips it there in the next
version, as liveness has it live there already.

> [...]
