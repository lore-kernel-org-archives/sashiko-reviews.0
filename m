Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186920;
	b=qTT0ZvdFn6LQFG3S7IMj75yslDcJvhibI0eQzCXtlEVKRNYsBBGUUgLWTfnAq28XVOm+
	 A7Ke/0oR0Xqo5uAiKzxD9fAA4eR7jJMff8Ef2UjzMzHpxImMEzL6adwtjpeQDkAxP3Xo5
	 UqQ0CK65yBeDUFWniFmfA9DLirjpURoiG+7klSInMLLyXQNpRb5w0J/t48Aj7Jv4qlnvf
	 8RBfxt5/F+HUWe+WpiPvkMr6idRTXJayTQ9DGiK31XWpaMLkiFfouwlf41D2qNHg59LvC
	 4HiYroj6/mRLr3SwkyVXnNRhGwts5YWJntsQjN4Y5ml4TnuhrtLBPQTgusnGbtRcGqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EQquq+i6TPhSReN9IjVRPVIB6xCEadhlzp/OpeuYVq4=;
	b=egfsDxjmsa3DEEElgyfF+S9gDuBjXxVUozyaI9kpE9yEFfhozakPflM6Pme1txCQ0pLG
	 ZotTACS9iPsFyAX6StJGjQ/GvetR4CEuVyYPzl+VErlCqres8k+QpxM4SZmv5hIVLlBBB
	 8agIfA7AXxy7XrmSFd+4Gt7dvAUK7LPPadcwb9h/b9/mKnx8R4F37xCR0EqCg6FrVSKK0
	 r3ZYL5xw6U8ZQVC0Xb/oojuFIScLMbGQkzm+oQFCVFXY1Z5KAp4ny1KR0sv+qxo2A+Czd
	 CNJaEJRsKYIlm/TciBvYZJkDaCGI4kSd0YXuQ5Zya+e3CEKi8VjdzomNeRWK2gOvC8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qpeibsaF;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344AC606C867
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 15:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344AC606C867
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qpeibsaF
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so634348b3a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 07:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186920; x=1795791720; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EQquq+i6TPhSReN9IjVRPVIB6xCEadhlzp/OpeuYVq4=;
        b=qpeibsaF7eQ/+DgexoGATfnPZZUsGt6RUJf9MnKPt88EFMjIPP9lY+mn5JfPWXeH5R
         A9+UzwPIqE4AZBn4L+PORD3lpOVOY32y0gnDzjViJOztefsPh7ysW64Fz2hL6Y5YnySv
         gPE8AzcrYUUBr26Nwcri4SiXvqJEUQKDr3zyWAWdxmwHlgWXI8EgShgrDBfKlQwzOlcp
         CfHOrwMSSlBbF0Mi+Rgx7965hXTLrybFEQZzBYokPHCHMiweEz9Jc8u3KvsFPwkoGp60
         BFUshzsHO2+5INMob9GRzG+W6n/VXOlnPzWSRMUXVYUXwum0dct2IAlaDPZ1ge+swrRg
         b5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186920; x=1795791720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQquq+i6TPhSReN9IjVRPVIB6xCEadhlzp/OpeuYVq4=;
        b=wCV0qktVU3wpo2eoS7XPLUz+UH8AzlJt4K/MtG4uiu+iobuY7YsNkLZF0Xg/IW+F41
         mvsdjUeM8bNfV9yeJ3x57zOwwo0oV2YEyiRXW1HXe1mLskb3QcAg/xBTsR+vLvaWt7v7
         msrEEUrPLzASfYIEOLgUh2ILOpbqOkJ9NYH8h0AW125YmIOqYY24TEDXtbPjP84N3X22
         Xb+Y/0poGgCg4AyZPAbj/f/mluFu4ouYcb2z57uLhf/dqtrtzH30+rpRASfuze+iFoTD
         7khi5bZWYDTXAm/KjLZawtagKUEnSWntYEfDM9b/w2xbC7Wz3qeGY8GysBoClMZJAQ03
         sszA==
X-Forwarded-Encrypted: i=1; AL+hErEF9Sez/2OlQxULnsblsW0l/sIrkyS8T4dIEPkcZbUXUa1hA/pEeeEzhX8m8f8+fVszphoQJbt0MULxQBtt+1o=@lists.linux.dev
X-Gm-Message-State: APuU4Z+TqawZzQ63shcEv+ihQZJPNxaMhgXmHl4ciOUhDQZruwmtKhaK
	UoOkfzZn84hnlvKoqemBqACgiZkL8CEynFVpDfoPXy9GeKryFx0TAcGu1bRv11U1ugg=
X-Gm-Gg: AYBFou0tO5rbidIE9Dn1EaDZ1xfMQC6B0FxcrhhTN8RdB19lF1o7I+tb60mPVCmbyJr
	CjuX1hBfDa3oCJpR29dX3KSETBytlCUqcye7xfD5NHlfe5YVTF0vZIv8VSze3+QaWZcUUV0Tvcp
	FdXNg5b/qHvmC9QALS2cI+I4GDh02vydd5+7Z4HyeivScxxIaSRmek0Z6r6hDpVLA+rWNiP4Ywx
	YFqq8OAKzZHX8Kn5vt/78zpehU24s6xoPal3fbnIbWZ0I09k02QwMQAn3HBEkv0iuIZt2RcJqry
	81cPZCVbavOl4vZkIjcDm9OlG6wiTP+/s57l7sOnm/WyR99CjBNrzoTm0YremCEasi2IG+323EO
	ysmn2OrPVfyeZXNZ2ZUNWDQfbauSkc3PfEOHcYaNp6XXIyveOjfMZV0096BiaVOROX3ZZkxhkas
	eAxIbs+sO1krbcsimn1mBUYVCDbKMcoVtejr4xnjCsss/1FYXUXsf62kh2lWRK+Jh/AZiJ1guTt
	1438R2tTZTRIohRkSxDfK1XFWnSx4bmjws7hpu+GqU1F1YLEAI0RKR/+Tp9H474JZuQ66l9LFIW
	+3UbI1Chl0nFCmrSAKQCbnW5C9YWwzv5CqtaQkMyx0rSOxpTXIdi047UIFB8pAZaN9TIhEhuQhT
	VAXVmUvoeumIHUW3t8Je/ueFwfR3RMJckocLYqg==
X-Received: by 2002:a05:6a20:c887:b0:3ff:f20b:d2ec with SMTP id adf61e73a8af0-4014dd66078mr3640804637.52.1795186919522;
        Fri, 20 Nov 2026 07:01:59 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06503dsm1398731a12.27.2026.11.20.07.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:59 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: Re: [PATCH] usb: gadget: f_tcm: put the overlapped command's request back on ep_cmd
Date: Sat, 21 Nov 2026 00:01:53 +0900
Message-ID: <20261120150153.3128458-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-223285@kernel.org>
References: <20261119140641.2768465-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-223285@kernel.org>
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

On Thu, Nov 19, 2026 at 02:21:37PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can usbg_aborted_task()
> dereference a NULL stream->req_out pointer in Bulk-Only Transport (BOT)
> mode [1]?
>
> Aborting a task in BOT mode therefore causes a NULL pointer dereference and
> kernel panic.

Right, this is a real bug, but it needs a non-default setup.  With
emulate_tas at its default of 1 the core sends TASK ABORTED instead of
calling .aborted_task(), and a BOT session can't send a TMF itself.  So
it takes a LUN RESET from a second fabric sharing the backstore, with
emulate_tas set to 0.  It's an Oops in the target_completion worker, not
a panic.

Fixed in a separate patch:
  https://lore.kernel.org/all/20261120113956.3071640-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
