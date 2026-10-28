Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153726;
	b=Y3aWPVTy55FMfy5urcSqCVdlLt1ufsEk6rnVn4Cw2L6N1aLFN3x+wUbU9WitOZ7MYuvv
	 GqWfsoDVwtodXrLt+PD+hv5bt62lWM7qAuR75LR1b+pQ6CnHOVNvZZKgUl8xsQGuIXIxj
	 2K6TlqzXTT6kwGRvQN7nSKnOYzp1irLEFQGmIHWnUjhIzvkbSGC0fkWGRG1FEEdnJBP/W
	 udX4hCGwNPALg3JbtrB3ABveuRpj3m0iVnOY9WKlSvwWzz9Bik/DyKlSNQjE/OQU2mB3U
	 sIf59tgGDvCSEFeENMeN+rpi2g5hw85RfN1EJ1Xu8XvmmD2JvcL2KHYB4BVstuMf6+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=9DPl79dHc6XuMltSswrZOUSsZxtmP6an99m6H1S4WSM=;
	b=k/khzFPGP7hgsx2Zu9WcZNeL7U447dNyYa9iioJp9rgRfJdPoLYJ4w25lKEcFjMv84pr
	 uRrD45FT9pUksRBSvl0mt96f44YTiV/cc4ZtGQDBAaOZ8xX64o3xQzSDvysMLWX3F9W60
	 b4a4QpGpstTedhNSHiK/SZMijzSkCl0CJ+CftkwjnWliI/SnQvW8stbFL4HYVohaQrsuZ
	 cSCD67mQtDRcm+AhvxuwDFnQcKPDEjLqdh6VXgFu4Pxqa3FUbYwa4vFduQAha7ykUfs7j
	 dKdMlog//TCagWb4xtAdqhzdm14IEjZr8Fr+EsdS23Pc1VUi2riIY4HNhxKgiV/9btQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3dzZMQb;
	arc=none smtp.remote-ip=74.125.225.133
Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF15606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 02:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF15606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3dzZMQb
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e7b06acb8so1972635e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153719; x=1793758519; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9DPl79dHc6XuMltSswrZOUSsZxtmP6an99m6H1S4WSM=;
        b=O3dzZMQbLrurgaDpNtZo9XWmY8krd2FKtzokdxWyd+CNuRH5Z6EXII2Pa6rVkMCoFp
         CmRFaGGZDSthXyjnwuNWQDZ+GtYe3Ggjiw8tDYoVyDX0Xbq+uIj5YpPc6kSnO3yq79wO
         NP+GKxlDzc+9bDLDOLQSDdX+frXRKp6UwIy/oMmc99YhyR4GyZetE7J7w1GI9IQ5q/Bi
         VLmyuPCE7kIkFz1iUnjumcEw0n356XAe/Fk+O3ZQikSsWokDLejQA5HYCcn+xiZvD4/o
         +/1MCk2E68CGMTZZloGlN3CqtzsSoAO4l4FCbkF5phQIBPc9z7MwF4lgHp47d21YicEH
         XBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153719; x=1793758519;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9DPl79dHc6XuMltSswrZOUSsZxtmP6an99m6H1S4WSM=;
        b=K8YuI72T/8bPU+WSZMR9iKfhEuzEPn6OfaWsrPz6+XLmvZwG4CboQvJzg1J+7I0gK3
         VXZqOtaw1pfk2CgeFkghaf/5X1XqaM/8qmwrpkOYsQUjAz9Dhs8a0QkC1k9x7agk2fBP
         0u/gTbxM6aRSrjLv9xeCts+Lj1A8bkdWGuFhKuRT0yekXBWWZISUXbhQZ7gUUACbJ5oY
         37vhVrMoxDJ/Gh/jxnSysuWCiu0qITke7TWP7tT++OLNT0q2VduDxUwURhf/bZkcbHZ2
         IaDrCisJrFFqtPE64ncMczaPrOO9iKVDr/Cf9wX3TXdUcwTGtpc4Ty0o3+IcvXYv4sKT
         6R8g==
X-Gm-Message-State: AFq9FYKW0xdQ+GEp6BcZMfiWtfALU82NtRSoQi9g7YZ2C6SWa+Lm0559
	9QULcXeWRcvv/G7AuezHPanfYhHFtu6a76kLssml52+AxKAYgFc4V0hftGN7l3Ud
X-Gm-Gg: AYBFou2Nyzir3J9zrkZZ8r5lGKktHfUO4ScpAEGfz8JmYmj1sW6V75xRLeSpD6cZfXQ
	YpR1dy+rPIckorrXIpT+zFS9OVWYnKhGgSmbLF6NwAUMOT0VX0ct0MU4JuEHBa9/NN2j7odmOeH
	/08fSU3OPlf8JShqYocOMer4Tp8Dvm5CYtBOjOF2HDJ6yqgk6cLsN8b12sH3GVYht+C6hjOX55G
	IMAIK3GZaDQjUCcq3RdkplvSZvSUWMhMYToPX4X3X9m0+sDDnfy9qnvMJ7S+1NUMfehCja1XsdL
	GimEy2qbaSQhM/ZbTAb8+57hObSUHOR1/DidWfEIB3sjmjZb71CU8ivjid03FDDLkdL6RRU+qK1
	HAMOPYx3UAGd/28hir9UF3F2+juxlBcQpyltGkbXTych6n5jBqcFTdK+uhvB2OA3HRjz545o3xZ
	nP5sagf4UoOlOq7VUVG3zlIOi3Ai0DexywvR44AooPmo0LVGpI3fXTT6Vc/NeyWw9Zv1Y1Vsfr3
	sEXeDkcrWgpMGzcsqdE2iXh7QAVC/r21KXm2P7fdUBJs9Yxjq9jtB3Wb00tvc0Ju4w5uti86uf2
	W0c/Hb/h5+MnyvpABXrL7U/853hMUeRHQHaElaWxfNkc9r9+NdkZvk4UBmKskFe+hoQZstv0sRI
	ilWJGSu4HStK/S1+vmVaZAiKxKwqLl1W03r4puA0OLRgyDm/qLZX32N33nj5vnczCyRqW
X-Received: by 2002:a05:600c:354a:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a9662a0c02mr15189905e9.9.1793153719288;
        Tue, 27 Oct 2026 19:15:19 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm10693945e9.6.2026.10.27.19.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:15:18 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [RFC PATCH bpf-next v1 09/11] bpf: Let the comparator of bpf_rbtree_add unwind
Date: Wed, 28 Oct 2026 03:15:17 +0100
Message-ID: <20261028021517.1203900-7-memxor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-187313@kernel.org>
References: <cover.1793147364.git.memxor@gmail.com> <d81d996f09e0fd0b07816dcd0541f39c0f451a23.1793147364.git.memxor@gmail.com> <sashiko-outbox-187313@kernel.org>
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

On Wed Oct 28, 2026 at 2:21 AM CET, sashiko-bot wrote:
> [...]
> [Severity: High]
> Does the unwound path in __bpf_rbtree_add() leave node->owner poisoned with
> BPF_PTR_POISON when the object survives __bpf_obj_drop_impl()?

Right: with another reference holding the node, the drop left it with
its owner poisoned, and no add would take it again. The next version
unlinks it first, as bpf_rb_root_free() does.

> [...]
> [Severity: Critical]
> Can an unwinding comparator callback with a two-register return type clobber
> caller->regs[BPF_REG_2] in prepare_func_exit(), causing check_kfunc_call() to
> release the wrong reference ID and leave a dangling owning pointer to the
> dropped node?

Same as on 03/11: a callback hands over r0 alone in the next version, so
r2 stays the node the revisit releases.

> [...]
