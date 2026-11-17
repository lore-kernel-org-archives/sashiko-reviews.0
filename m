Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875189;
	b=cUj7l3NBygOoTR6I4c7OtOFAZzFDfU4rIaxx12RSIo8wrc+YVaPTvDMSV7s2WluJfSP9
	 zjNG+Gb8TiNABWxGAqc/tkyIAi1xcLWJhWwN0K1r0PFWsDwa2XZBKXXCo3/nIq6TaU1L/
	 AclE3r8yfqnLyUJCL4tUzTG8ur4RllWfncfiZnlNfV09SdizQXf5LGex0x0MqQmjctrru
	 1eGcg1fh7Gl+JgHQcoi8kXzxtDEytVBuLP0wlsKrMubP949MYHqsLDUwY94oIzhjY7b57
	 3aZRly3Pl+MycOy6r1iZZ6hMNCwcOC4iBb9frHGeKQKmPZMWUKDnvpCCTp6pRg4l9kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875189;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=1IF7o/AtrOMvQGCYw2joPZttg4edu/s8LsP4afvyeNo=;
	b=gRViQLkMmDOjKCR+koPRLjtacTxSkHGzwhH+kpYuwQom2kmNZ+VsLlerUk0+1jtEkfsR
	 aPw7ebxXz2R2k2V/kTzx0GRGPYGm6Jf4wFIx9XTADsQd17FNc0FnhU97NjPiXXh5qfPbr
	 XxQTsFErhdsKJBx6zkAZ/SYmJD1sMBUn4aItz66TtxI6pX5IULLYfzED8UHwO2rkmY1Sg
	 B+bkG1OssUIa5olAiP6a73MkOiDGf6Z6ft7ANrHobvVdfix+znBYwsYSqiqOdPmPGvcUI
	 DrBUg8p922SHbj7D8z7kQVMdg6HbyzwwwqXBAgq6/LKQ8Q81AdnC19aYxhL2sfAEueg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC957606A329
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 00:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC957606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b1535be329so3018331a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875188; x=1795479988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1IF7o/AtrOMvQGCYw2joPZttg4edu/s8LsP4afvyeNo=;
        b=ATgE070RiVeOFt0XszPfb8AmekKRgAOivUWevvqpnUvrGMqW3ZnXVCEgi678lPwbma
         wA6Qi1xYW70fkp93YwLVj+P6xSFRGPHlO81zzBE4P1qKbX9DTkiCQoHMWypEGQNxYii0
         YustHcu+X5t6TiaidLU8Onxns9f1S/dFNyrc/LJD1wqBkZpbQmw/MAWpJqL2dxn/9mQB
         0YtkJg9Z/zq5xFOZeLeFualfn23jzfXA9859k61qlNrWf4Z1Ywn3JkejdBKaNSGyVR/L
         GkUN9DXsinBg6mOAy0XfyTYmaY1o/gK35SlCTgcM12WsIiebWMMvGO6dNnOrfcR4O/b7
         w0MQ==
X-Gm-Message-State: APuU4Z8Ezd0Om7SXn89qKSPgOS0UbPB8ZShMIWAL4y7mffP14gVCKDff
	aOQzyHv0GJPjuTV/SBkyxpRN6OApJmV619dnzbWDeoQYsHG4t2o/++2mhVBQGCE+
X-Gm-Gg: AZFdTZePjB9mTMnwFsU0tQaJ96vuxQ/kHkIP8fsJLTAHk3mLJXN+huH+fx1A8loL9UK
	1TLY1TpWKy4KDGzGknaCzYfiTsyE1oI2820hDbgG0BtzwqHYb0qN5ox9jhjczHU6Zm82f7Sg3iZ
	KU7X+nSHialumy4YcBudXvqy6R7vfTzoIg6VNdFNzdS27Jn3/nxS4Cp9L4bWvu8d+VO4eVLttIK
	Za9TunpnSXmobqB9TgomTvG+d2RZAUG2hy2fIYX5Ehr7d4rLqLnUN43yR9DO4sfxjmFam9nR3sp
	gX/IXBMlFpPn42SwX44xSaaOY4Cga1wtGx32Vs9+Vs1zi0ngHRT81Z2ab9jUiiLcNIQwc3Bs+Wr
	am4VF4PLYnYQwzorqUtQbkGdlcyCbxEdexitLpuGmbcDTRlI0Vy513iVxo6ypsDWfNxcX30nL0I
	MFdfwPafDzY9vO2tPZUI4DiYYg6i2JIgL+4V8cMZNMH2fQeIYgraCF3VDp/2ri855infpNPc+mL
	lVqhFki4HY9hGKner5QghWGidhnxOzdypyNj4VWrExJ/gVRCNsodtuMZGi7rB7kN5/QLyGHa4SA
	2+awoYLSrtCN2SpZetw9LmjhE9cIKB0eCj6LKUOZGujUqRAQqF4h7s5M/nX+apZrBGa4eDMvXDO
	83h8/rADzPiFnYyj07Pv+hOilc+JS/famwkwBwdIW5h8v
X-Received: by 2002:a17:90b:4c12:b0:3ac:a1c7:20fd with SMTP id 98e67ed59e1d1-3b1b081b37fmr12119638a91.4.1794875188089;
        Mon, 16 Nov 2026 16:26:28 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abd06666sm1213348a91.5.2026.11.16.16.26.26
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 16:26:27 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380b40312e2so2203805eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:26:26 -0800 (PST)
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id
 5a478bee46e88-37b7bba83dbmr6574275eec.6.1794875186398; Mon, 16 Nov 2026
 16:26:26 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
 <20261116-omap-mcbsp-tdm-slot-v1-1-6c9f7aa45a29@telaak.dev> <sashiko-outbox-217774@kernel.org>
In-Reply-To: <sashiko-outbox-217774@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 19:26:14 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ626GTu3Lvb6Fcn86BARRRV7YYg5=dcTmFt4L=QThS29Q@mail.gmail.com>
X-Gm-Features: Aa3M54pgjWtyIXJ87iOCXvH7VHiLmPfsiy4hpiocOy5UhsnAmGKWL7LVFibdBLM
Message-ID: <CAPY4CJ626GTu3Lvb6Fcn86BARRRV7YYg5=dcTmFt4L=QThS29Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026, sashiko-bot@kernel.org wrote:
> Since this fixes the 7-bit mask introduced in 81da6a9e49b9 ("ASoC: OMAP:
> mcbsp.h: Clean up bit definitions"), should it include a Fixes tag?

I left it out on purpose: the only set_clkdiv() user divides by 8, so no
in-tree user was ever affected. Happy to add it if it should be
backported.
