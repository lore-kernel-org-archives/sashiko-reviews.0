Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153717;
	b=Dz6SY8cCOsgexiy2kN9GgUUdPEV49NnDZ7lsSOJ9yjGjeZeEflj4jzsiD484RSCsrxwD
	 1VWP39UJdArW5rsNa4tTW5zM5LiM3SeKG2/Xi+hHIO1fe06mM29Y5WeLECB4QyhdliE2F
	 WsHGBQdQi9RudJj1arl9OnNEQHT5sWwNxhqvgV34v3GfZwir2Nmi+wdXKz4sq7vEidepG
	 4glCNq1jNlp5Tk3PjTRNV9J59mMOm9vjq20jAQuhRuIFzyFMMkbhlFCX2fZfctdQUSIv8
	 AzLnxaqrjHTFD5Z6JB0MuralOBk6rsPNyZNKEUGn5W6WZqSgkjZshEiv/3yFBjiU3xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hvomCCgFzWhpYBXa3hhafOnqFJIwpv7L2EVg3Oed+HA=;
	b=uk9iePfT0uglCiPEowfrk5bazg61FgjDW7bhTLr77Z6meVPLuCe9mOWURLiBau0NZ+ww
	 5owqY1bLmv2NiCjG2cbPnYEbCY6gw+XbFoOG/ENBh6eb1ySG/X14RT01GKNcx6MKnpbR3
	 LNjEG4PwN8RQKR/cDDyrNgjrY3R6fP0qPG0eiJVO7RL65Uigph4ThE0dyk0/eC65fnsfQ
	 PYfMPmjupDkng8z6bPG0RItQoymlzxHuKg2nTDmFqC+3p5mpcjMRxS6dZ+eiGElvKPi0I
	 KZbPKfHngyTCKtFMYaud7THQd5GUXEPy/SvSm0n2ItQWAWynlgEnG/4kri4hTioWdzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AjetdCp6;
	arc=none smtp.remote-ip=74.125.225.128
Received: from mail-wm2-f0.google.com (mail-wm2-f0.google.com [74.125.225.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634B7606A324
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 02:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 634B7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AjetdCp6
Received: by mail-wm2-f0.google.com with SMTP id 5b1f17b1804b1-4a2d6cf8c98so1007275e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153716; x=1793758516; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hvomCCgFzWhpYBXa3hhafOnqFJIwpv7L2EVg3Oed+HA=;
        b=AjetdCp6JFHKCDsnvHXsD/BqgBhX10KJTWdlkw3Cb/jimxegktQ4pwKpMUmYijWlNV
         Hrncd6uhj8dmPAkcG8TtdbADKHPmBN8V6FzwtetgPTu4slm2xt7QiwIAJjgdZDdc+o2p
         K/5mawuTbuvvpUtdkOlPgzu2+oYIonlNEsaKU6iaioQ1XABzNt4QbtN3ltXgPXAgfu1u
         RPtek+xEfY4ZieRoBN4e9Hpm+riJo/QwtCkhwBVEedf6tqYmpIta4iSa1hLPsCUxWzhw
         ZWpw2MVSL/THaFrEKsscaAAIY5xaF+XB99pNO7/vlCv4dPLC8JwxxydN3L904wCeu8e5
         7b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153716; x=1793758516;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvomCCgFzWhpYBXa3hhafOnqFJIwpv7L2EVg3Oed+HA=;
        b=0LBEQEHTQCKmTdmnynQHhq8uThogIkBOvTTP0S/Vp4DJxxXMtCpmZY0Q0Is/GJF8+v
         wxQE9+dgDW4Pm9uTOq4YUcrqY7QI2sLwzQo+03Hpl0EKIWgWQ2gsnth8QVFTJfQ9ZCwL
         BMeq++uhIae0U1wfPF/7QqpxuuXciCYxP/WpI59jA9GYlTAI78Q8dEZT3XnVkkAAgt9e
         K5ktLeRsityDtg+n/c6cXiLqpcd3KmKAaDlZsOsEeK3vqUWlAmLwHdR0xRUbbSSecpJd
         xMIsXKK5zRv2MtMn2THsQKzXu6C4wPvcqnK5pOessWLWLac3dBgvp3V5ip4VqC5AfRIM
         938Q==
X-Gm-Message-State: AFq9FYJ55G8Max0LV8dMPL2n6+zX17jKH4zxzdjZkGezvgnMmyJgFtk2
	E0AIjiuPM+HOZk1S5vHBxvWZU+tPcojywSDdSxMMdXk8cQigUwNMSCJ9RXEvHNQ0
X-Gm-Gg: AYBFou23D/JcfaRzsV8YnVkkV4vbwMH/oY1qpz3ZdJxBDSHRov9szwxpAhhvWxBAtRs
	HvA4DuZODnQQqbiImYZuO2VlzNI7EbUssCXL/aEUJzxzS3lY4xzdXkninzr/QC8p9pUZ1B6bHt0
	AsUzhvq02n5wBSJLps3f+X7Epq/fWsEtHm+b2FHKLWrN7zhSm98+j9g1ZuEs6/Ig6kUS4u1yJgP
	NdXykngq/erZfdD8/kmA05nHWrodrhhjwnN5wBc0w08zlSFFi0CJiWAVH4ZOPhe8IUh/w6NwNrD
	IO5WhUfDWB7l+boOXf+1tKTmYOZ2Bq3T1M+8keo8avPxCdfuTbKrf3ZTOPu0XCNk4aFTLY2NJze
	QtXc/e4LgsOwSa1SKCoyGWWclNn3Q5np/VMPr3g9nPtTGUFEoi1/bBjGS5ZLSz220uPr/YZldRi
	wwmTMDl4TcfJYnQO+oh93/qm9wsvR/6lRM3ojKW+ttEPKkNK6Rk88BvQJLF8YqPeEvEGxSGeZzW
	IAdsUjzis9ESA/RleoJdkYuY7XSr1DUhNoqKco9GDyE3zT5ii6kzJbPM9Or9HcsLhxBxngtIIhw
	tY8ZPobl8w4e9enGNI7u41ft99OpBbUlRkUNuVey8DzuV+SF9heo6qTA6/FUPg/qb1dWOhGP7A+
	HXY5BfIfTT7gbz+Xd7689Em+fBTPC2qC8zd0PYFey1vtoF0fYlRIzQf4YCr5lqZFqG6xO
X-Received: by 2002:a05:600c:34d6:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a9660b54e8mr16323345e9.6.1793153715858;
        Tue, 27 Oct 2026 19:15:15 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97d38c583sm9336845e9.15.2026.10.27.19.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:15:15 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [RFC PATCH bpf-next v1 05/11] bpf: Let the callback of bpf_loop unwind
Date: Wed, 28 Oct 2026 03:15:14 +0100
Message-ID: <20261028021514.1203900-5-memxor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-187310@kernel.org>
References: <cover.1793147364.git.memxor@gmail.com> <25728094090d9bf3e4cd88feecec336f0493a5a9.1793147364.git.memxor@gmail.com> <sashiko-outbox-187310@kernel.org>
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

On Wed Oct 28, 2026 at 2:19 AM CET, sashiko-bot wrote:
> [...]
> [Severity: Critical]
> When helper_has_cb_pad(BPF_FUNC_loop) returns true, can inline_bpf_loop() in
> kernel/bpf/fixups.c emit a live BPF_JMP32_A instruction that jumps to a dead
> landing pad which is subsequently removed by dead code elimination, or leave a
> stray BPF_UNWIND_GOTO after a load instruction?

Same as on 04/11, fixed in the next version: the inlined loop gets a pad
only when the verifier saw the pad of the caller, and the unwind_goto
after the call becomes a no-op jump either way.

> [...]
> [Severity: Medium]
> What happens in prepare_func_exit() in kernel/bpf/verifier.c when a bpf_loop()
> callback subprogram with a 9 to 16 byte BTF return type (ret_reg_pair == true)
> unwinds via unwind_exit?

Same as on 03/11: a callback hands over r0 alone in the next version,
whatever its prototype says.

> [...]
