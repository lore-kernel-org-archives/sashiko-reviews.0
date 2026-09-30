Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71812513551
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 18:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790792129; cv=none; b=CEC+rjutftVSNhgZupOZEfduDFPTZ7cN7XWNjizAicLw851v6pNe4ZIBnwJe6hfgN8+2vXT7JA8E5kMJbXUjufCP7dLKgJyuU/rNbs9j2/qEIpQHDr1KomRkaF0WJokMPRhSE70Cw3dAdLopHYTkzpxxdbjxA2UcGc9emsLylvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790792129; c=relaxed/simple;
	bh=PjwQSo8+rc1z4kQGROqeb9DwEQTAe+aDRBgukQAKf5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/16q0+y1De67VHzXu4LR9FTktGc49L7PfOURFWd2QOO+ei1fGBgsGDVRhQdxssO7TFzUGayjIQlmno+rLVFE59RJTGXzx2kP5J+omFlXtydfuKIsZXeAtDyn/wIdavA52Mwhzfk0nTWqepnasHQQs0o6V4+QrGI8pO5UXXzZ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcWiBgxg; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcWiBgxg"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b223602d7so1666224eec.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790792126; x=1791396926; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wH6osFmbfPcAMlnmB5/HkiVaJyqglqDpKQWfsMmkLu4=;
        b=CcWiBgxgVf46o/GlDBFV25EjaiApNWoHeLSkdmoyhEcGtt4MqC8cJBHtevk2pYSXr8
         xOqCHxwjLBxyRygrM7kC60y41CTDoBbHC/TOKbP3hlrbuTv27cNCXn5kD7r3j24sYcDu
         pkVrM1lhCYcpKyYMNTMHIO6KpMxS0KWF+m4qbx1pMyfOCpCEn9SNgni1uiveTLVQRrjJ
         sJAGcQKEQOr3CoNJMJv0G7eaepXPCNpWMul6rmwuTa745+cVjc+PU8eP7pgRTRN8/55V
         3a2qAmZT0k8JeEdNiVQK7K1oDCgoe6drM0/+U5TCPjd3xijecBgNII7cezXutFrJiOA0
         jXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790792126; x=1791396926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wH6osFmbfPcAMlnmB5/HkiVaJyqglqDpKQWfsMmkLu4=;
        b=PT9n6IeAm6nL7bmyc8HqQaZSrcdK7sr80cRmiOnueBd8au6amZv1oK2GnHTIxHG+Sd
         kdqjlAcIa85F5nPukky97bVX7hyWzI0PpBjsAu4Wf6cd7Imu4rnCFM3t6rdvA+m5XfSj
         1mD68vCnUFLb1nvrTfj7F9NjFHOXnIorUOY2B2mXsDHoEqqTRwYuMBLRxY4gkKvr0WiY
         g6t2lRbnvXtwd8N1jVLyotXI6piLtASflHt6qB8GU1kmn3g/uBhdamIN0xBsIGgTA8tR
         3en7Lw5Y5PdCUNfmerLV29bwpDSijJlmbXd9ZEtiLsbV100rovLqznI4fPE+yWnpfRoJ
         KMlA==
X-Forwarded-Encrypted: i=1; AKwUvBwqHRjKeH47m2eomBSuPy15pcL3Gg+r8BHkNvc3/XpaYzC2IrzOFThg0rolPnhXjSEeZUFRz1lMtLjMuSbbzG0=@lists.linux.dev
X-Gm-Message-State: AFq9FYL/nocMsPAbW1HylZ8H5cBWujryjXz/OqpuUxJUvqESTJY6v1P7
	cEMdfNeD1qHfz5Av4lYt299rFt0mhVkrA7xRz/pucI8eO/huI+aa76Kt
X-Gm-Gg: AYBFou34/q4pvT7ltVy9JPi0ucmkkMTs/z11DGAwRcey3LW2KcnF/QDKW1YSlQt6rgu
	AnC/UZxfpw9NweRKp8DtR3/cR5RDWWv9Kv+6NPdmoWCmAtL4av3z/q9ZCdATShBOa0Ah2SRN/Pj
	DDzsMgPpQmr7ORTPeyslRmru+1J0o5xTZ0kW/+ZiHYFEOnZ6u0JesGZLbBK5qed5hwjeGU1n1pR
	x2TgljBvkhzh3vU5PYny/7V/i/+4E1CdhnZGH00LTL5/23NcEOsf5/E1wcmIMHcN2muNzjKMzT9
	YGP9vEK0kt+scQ1BjDJbWfUXZ9HVCmKEBH7IDrj9rE/SnP47Zfrf7bQpu0aIfgXpHgtDj+hN3XB
	nMY+pC68pAwu9LlLhnlHr1iFU/qY+zWpjTqsPFDjpgBow8fEICAZ3vOBZEUCtx8OyO4Sq78Wt25
	u0jy8nyMa6uJBXw6WuqJY+eSVqlpCz/A6doLIUD5EU5GIYQc+LnfNlB174jnukZ0FOSso9vXd0D
	HQnhcNwKQE6I9PyfIeeJLuZ7ywfuNlFdzhByOjq
X-Received: by 2002:a05:7301:1a02:b0:34b:ee3a:10af with SMTP id 5a478bee46e88-34cd91735admr2161022eec.4.1790792126094;
        Wed, 30 Sep 2026 11:15:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f011:1d53:dc9c:51d4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3f3159dsm572457eec.20.2026.09.30.11.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:15:25 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:15:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Habil Eren =?utf-8?Q?T=C3=BCrker?= <habilerenturker@gmail.com>
Cc: Habil Eren =?utf-8?Q?T=C3=BCrker?= <habilerenturker@hotmail.com>, 
	sashiko-bot@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] Input: fix potential use-after-free in
 input_devices_seq_show
Message-ID: <ar1RZeMi9OK4Gro2@google.com>
References: <20260928171306.59206-1-habilerenturker@hotmail.com>
 <20260928172128.D6AB41F000FF@smtp.kernel.org>
 <20260928181704.61015-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260928181704.61015-1-habilerenturker@hotmail.com>

Hi Türker,

On Mon, Sep 28, 2026 at 09:15:24PM +0300, Habil Eren Türker wrote:
> This patch is withdrawn.
>
> Sashiko's assessment is correct. input_mutex already protects the device
> during seq_file iteration, so the explicit refcounting is unnecessary.
> Additionally, the patch had two bugs: a refcount imbalance in next() and
> a missing IS_ERR() check in stop(), which could lead to a kernel panic
> or use-after-free.
>
> I will investigate the actual root cause further.

To save you some time digging through the syzbot reports I had an LLM
scan them and here are the findings:

It is not the struct input_dev itself that is being freed while on
input_dev_list, but rather the strings pointed to by dev->name or
dev->phys when a driver either fails to unregister its input device
before freeing its private data, or leaks an input_dev instance.

Because syzbot groups KASAN crashes by the top frame (string_nocheck() ->
string() -> vsnprintf() -> seq_printf()), the 63 crash reports under
https://syzkaller.appspot.com/bug?extid=bc6b37960b1d13f68f9f actually
belong to three separate bugs:

1. 25 of the 63 reports crash in irq_seq_show() (kernel/irq/proc.c:601)
   when reading /proc/interrupts, which is unrelated to input.

2. 29 of the reports (including the initial syzbot report [1]) crash in
   input_devices_seq_show() on line 1178 when formatting dev->name:

     seq_printf(seq, "N: Name=\"%s\"\n", dev->name ? dev->name : "");

   In all 29 reports, the bad read is at offset 0x758 (1880 bytes) inside
   a kmalloc-2k object. In most runs that slab slot had already exited
   the KASAN quarantine and been reallocated (for example by netlink
   __alloc_skb() or sk_prot_alloc()), masking the original owner.
   However, one report [2] (log [3]) caught the object before reuse:

     Allocated by: redrat3_dev_probe() (drivers/media/rc/redrat3.c:1023)
     Freed by:     redrat3_delete() <- redrat3_dev_probe() (redrat3.c:1124)

   redrat3_init_rc_dev() registered the rc_dev (and its input_dev, with
   input_dev->name pointing to rr3->name at offset 0x758 of struct
   redrat3_dev), and when redrat3_enable_detector() subsequently failed,
   the error path freed rr3 without calling rc_unregister_device(),
   leaving the input_dev registered with a dangling dev->name pointer.
   This is already fixed in linux-next by commit af452b9e0133 ("media:
   redrat3: fix UAF in probe error path leaving rc device registered").

3. The remaining 9 reports crash in input_devices_seq_show() on the next
   line (drivers/input/input.c:1179) when formatting dev->phys:

     seq_printf(seq, "P: Phys=%s\n", dev->phys ? dev->phys : "");

   (dev->name does not fault there because xpad->name points to a static
   string literal in xpad_device[].) All 9 reports read offset 0x220
   (544 bytes) inside a kmalloc-1k object (offsetof(struct usb_xpad,
   phys)). Two reports [4] (log [5]) and [6] caught the struct usb_xpad
   object before slab reuse:

     Allocated by: xpad_probe() (drivers/input/joystick/xpad.c:2052)
     Freed by:     xpad_disconnect() (drivers/input/joystick/xpad.c:2236)
     Last work:    xpad360w_process_packet() <- xpad_irq_in()

   In xpad360w_process_packet(), xpad->pad_present is updated in URB
   completion context and schedules xpad->work (xpad_presence_work()).
   If presence packets toggle xpad->pad_present (true -> false -> true)
   before xpad_presence_work() runs, xpad_presence_work() sees
   xpad->pad_present == true and calls xpad_init_input() again even
   though xpad->input_created is already true. That overwrites xpad->dev
   (and xpad->led) and leaks the old input_dev on input_dev_list (in [5]
   it registers input69 through input79 on the same USB interface). When
   xpad_disconnect() later runs, xpad_deinit_input() only unregisters
   the last xpad->dev and frees xpad, leaving the leaked input_dev
   instances on input_dev_list with dev->phys pointing into freed
   xpad->phys.

[1] https://syzkaller.appspot.com/text?tag=CrashReport&x=12bef8c9580000
[2] https://syzkaller.appspot.com/text?tag=CrashReport&x=15d46e79580000
[3] https://syzkaller.appspot.com/text?tag=CrashLog&x=16cc5679580000
[4] https://syzkaller.appspot.com/text?tag=CrashReport&x=115fd67e580000
[5] https://syzkaller.appspot.com/text?tag=CrashLog&x=17f40456580000
[6] https://syzkaller.appspot.com/text?tag=CrashReport&x=11131092580000

Thanks.

-- 
Dmitry
