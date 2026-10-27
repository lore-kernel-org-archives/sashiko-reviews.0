Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113313;
	b=L3INGcOwjiFd9h5f0FoOG6Lobx4rO9d3FtDz3O3lamXg+J3e1/Fu+qeGiuaAuOdxI0JO
	 hnyrBbItJbTnc/u16hqYBSsQEnjG4epXKAx/e4h4+KNAGAIf7c5H/cagg0dl6T78h7UGA
	 mQYPkIuACw78LvWAAzw+t9p9948KhO/u2Ejh4pbxA8wxT9Zh2ESJidq4jGT/5yNQEyG+U
	 AaWrQaeQOTJ0pXokN0TkHBy4MSAuaijXoRA7QSQK3RRSUpx4+7S8BH58RVPGyj6DMXa6k
	 9qm/iGOOYU58aNdj6Mm5vE6OCynbwvGEsbl0hnxWH1Xz5OWbu9igFICL43ViKb1V+2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To;
	bh=4JSSeMn7jD3hzJLmiAPL5D8xsSZOgnxpk+LkLJ9f9Go=;
	b=poeyQyjz73FkDCI8qHiiidkGt3uB1v6jFri2yZu3xMxfeUQdloFb03kuI1pgpD7enZPh
	 uQgK2iQRU2TYVDNgslIeWjvG/yoAtbuEZxtglHHEpufMsFXau9Wugi/zgZQhEVZWlg65w
	 KUcYOGT7ICseKuN6hSliYcgCX/I1Jc16pKmYdtGaSqMAPSKncCYeGlegjShzwnJhwRkns
	 6fPsjX53A/jneGKNqBSzDhfABU3beM91MDoRVjX8lk1eLYCkSwExjxGOGM4Cwg9kKiTJc
	 Z+4zvENoqBK3kAhL5XCYnupQHmZ+put79ydxiriwJE5gYB/yw4Pybu2twuyVMMp8bzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIvV0m2P;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C96606BAA2
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 15:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C96606BAA2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIvV0m2P
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc502d509c0so8671a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113313; x=1793718113; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4JSSeMn7jD3hzJLmiAPL5D8xsSZOgnxpk+LkLJ9f9Go=;
        b=SIvV0m2P4sCpKjlx7LFueEaD7BcQ58F3miqdB2kxtyLhwq+RtWh+Z1ZF5KW7QgiHvP
         I4rVyyyHmS20lm1q/xhoCeB7LbFB2kQVUAbiAiDn4oqlhMUECrX64QaHlvsMvYIMwbBP
         FL6uiwRdse0Nyk1YZp1OqhJ1gj853Yx9PHP+Htd8CUYwVA6MOLpIH3osgdarbcLCvRZF
         vkdEvNNTuAMMQQtm8HLFm+ZC2OeHq/bax73VNVaA+E8bCcYygRfE2ldoiNXRr9xyE6Zj
         e0wRRb2f4dxhlcFIMX1kCYU4URKNDL8Qo6sLfc9zq0evHi81HLOYCF9X1O0bLln+emdE
         q8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113313; x=1793718113;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JSSeMn7jD3hzJLmiAPL5D8xsSZOgnxpk+LkLJ9f9Go=;
        b=arsmd/tlYps/rdJRDL0okBZMx8Cr2HNi/VQzvtd8PDWH4/RtzI3osrKmK30MwLzEaG
         lmzyY8PV+jyfsh5+aT6yhOMDLMg+tkMFmKn/ZzXPqCZXYOgc0OJcc8b6EfBZszGpurgW
         b6QiRb2x1lLxYHCakJT7e4Hp/86B3FEDkildYNTeKyxjlqQSKK4/hxF0HVRi+sA257mp
         qr103InC0VMr9qCDODwtrbeoOsrgqQo+5tfMZP/Mclej1A+zoW6vy4ebYnNl8UeK8lvU
         Uemdm6Ie4U5Tqt3lKGjAXg2AuOcvNbD8WqXGPuXqGesPdyKAFOlafnH+0pDq4bGm56Xd
         y34w==
X-Gm-Message-State: AFq9FYIA4lNKxRpV9YRcPyFPfbvgVojdFrpIl5L8SZWt+RntX0cChjK1
	I8euOh3XtLgMCafJiR14NXK4bk4Tyitxm7trmrjJFh+xeZJyLQtkpeeH97BMZQ==
X-Gm-Gg: AYBFou1yafapkAjFAVNsgNTD0Qq44QbD0y8mBLoTXL8pKIQW47phn8VTcDXpVRVpDFZ
	ye+CEAclhii5OUfJbjW+nROTqze9MK5J54V9DFiWKMqseP9OvhELS3apvn9XtKzRrzA51iFJ3Rh
	z4JV98nUZYMIyvUyYcgL8GYGntRQTogQsBIXHJeWu8s7oXPjwhgUoV9W6YBN5apLwTDQOGcPHME
	JGSpfHB6QPvxo9lNXQZdnfUUG6lxdI0K8ZbDAtkE+PCNUbHhh5nATBm5CUCet8SX7Xik8htMUGQ
	E0M7fe+dyuJUnmLcSqcS8kVPaADPw0LKdio69fZv9njT86ZlhiG4q6Sbna0X8M2LWeOiwflNwab
	WNb7qt1UY49UPDHHiXDdxCTwfENVK5nGfrQL7QRrcRYhsGFKOgvfFIHikQrIaJKZ1bzSNArH50C
	0ByKEmkpT6s769P6SYpwY6KL0l2lY7ndlRb9DMcMlUki53qMDxCYM6Ij5LT/xwDVqv+kLkIe79C
	Ch9pAnHF4FfwQ66wL0N1sCmYZx5HJHyCaoMDofo6ahnMx6lWVMGDue6Z3Og+BFKZMyTl20ArFgS
	7pccQKsnY3+NvApKi9c+D1DDX4jlYh66j1KzOaf+YeY8njVo+HWxV1jAjfrr+VfvucFnxEJjEA5
	k8UaJsYVb1esTX/+OoncNTl+9LiDESeHf4kT1/ZQHr4h3hnsFJENeec4=
X-Received: by 2002:a05:6a21:71cb:b0:3e0:c102:33d8 with SMTP id adf61e73a8af0-3e7cd5014c5mr6505768637.56.1793113312516;
        Tue, 27 Oct 2026 08:01:52 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccd63b6sm2848985a12.29.2026.10.27.08.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:01:51 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 15:01:50 +0000
Message-Id: <DMFPMAYUPSDU.2AW3225P0W0ON@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Cai Xinchen"
 <caixinchen1@huawei.com>
Cc: <bpf@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <selinux@vger.kernel.org>,
 <dsterba@suse.cz>, "Chuck Lever" <cel@kernel.org>, "Jeff Layton"
 <jlayton@kernel.org>, "Anna Schumaker" <anna@kernel.org>
Subject: Re: [PATCH v3 -next 06/18] LSM: pass struct path and struct file to
 the inode xattr hooks
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261027121151.1887650-1-caixinchen1@huawei.com>
 <20261027121151.1887650-7-caixinchen1@huawei.com>
 <sashiko-outbox-186599@kernel.org>
In-Reply-To: <sashiko-outbox-186599@kernel.org>

On Tue Oct 27, 2026 at 1:02 PM UTC, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Critical] bpf: missing __nullable on file arg in inode xattr LSM hooks=
 allows NULL deref

bot is correct.
Please see commit 94e948b7e684 ("bpf: annotate file argument as __nullable =
in bpf_lsm_mmap_file")
and add to kernel/bpf/bpf_lsm_proto.c when args can be NULL.
That's how verifier knows.
