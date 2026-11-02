Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657122;
	b=Gp0ZAOvchX/Lk5K9GylZzbnFS7HdjY88f8jJXM3iKcCiVuk4l6crM0OfQCYoCt8Hq7Ou
	 JPiWODylOtHeTSK5WYLj1dgxinO5MBy99L4wGq7Cnc/nRBgUIWoJb13R8lQHQq6eUzXHq
	 gduGbwdVeDKpqO37GJf3Gjtgqw3IzhPY1DnOgP5RUXaSSvRBDUw76ekltSM4cOljux4BF
	 3RPCb1SNK26I44rTestJFFi0oqqBOdEwqnwk7cXxvlcjAdCkAl4mx33R+2nUBPaUU80Je
	 bLBlGzjzJ9NpahcEi0JgDA1liagbPrW0wlEKYjUZKcKESK7K9m3vdkLvVBofofv6Hog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
	b=zB6OKUR3kEL6BqWRSI+05sF999QVyXNK2kp97QOPEGe021PxNEmGieOMImIvPsIxl+3v
	 RkTzdVAHVdACpWA2Vl7G0pi9t2E6Vjn7v099iyYdI01FmNPED/7oMhdKRnVeBrTgpSNPg
	 jLzonDNxeHnB9Ud573Zp3to53vE9vwulYttdVpFtsGWlWzpqsntWnSXdtyBzK1b3c+mj0
	 UH+GqlgynHOgo3EkUSsRddmpzC3uFU2rhDLhsrJ8KWaLZoJH6iQf19+c7XKe41ijysCCU
	 18lIuWDq6i8KBBWvPIewERc+Cp/U6qTBU8ijmg4QE4wSLOYmIpmVoSGsUMsBuZQCijQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pyc/6yv9";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0848B606D83B
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 22:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0848B606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyc/6yv9
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4496171eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 14:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657121; x=1794261921; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=pyc/6yv9kGUS9D3PB2BpB7jC5XdxwLZS/L9Qx8/5zCysfoVBjKgBeOAvHeAiWLTXOO
         3J8QiQOdS2NcBQ5IbTN1qhzf5Z6ZyUvXI9YZBcDhSM4iaU/VI+WaXARoUCSJqzpKKMc+
         ST1vrTU94qsTxisdhJwpD6M5V5mUoMTYA6Ltvr9dq2gjOk5LdK/7c5Qqdp90vt47jSuB
         CCCtVal+9K1RiOZHroxZKqZu1ijMHXBzBmGd7g8j9EM0r7jqekT0DD9gczVrrcquukLZ
         kvD7zx3Gu1iFyEY2dV48L1LSjSG3sj5WXIzEmaM6Ao/bndEmycMnuzR6dumhWUvqR6p3
         AycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657121; x=1794261921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1X5bXRL8qqmcC6O9ai7+IAT4c81ATWUWkhjo+536Us8=;
        b=YtNSV4QPQkSVAHMR28j/x/BdoBzMnshCh2nBY+CUKz8KjJPXbKjvcLmX8bGZ93Z6kL
         yB/KKLCQIUPxklxt891icGQ3V1ldJit2XmCWdYSy+lNL2ZJ9XHOvsPf3sZqatMru6kk5
         35XAMS2XhstSRQyNBvR+S5K+HEqr9kQE8R+rhakN1W0YZA9XRT6FcfOeUMTnTGlqOeNw
         /3NUhZkl1i9sH/kWTGf4MOKfzQQQZfuxv1oaPHIgWX7FdCgIUeimBgGbZwAe7CdaAKA2
         851tX/PgWMzUa1IRNFJyNmwcjpLW6/PeV2ctJHFiGq0h5UaziEVoWZ6SAEsx8vKi0N9M
         2YPw==
X-Forwarded-Encrypted: i=1; AKwUvByRvI8vrhAFuWgV7DB/9Ez6HwFgppRlbmEbFxGHlSLSCeFU6FE3miSNjxAvj0QTOFRfCnY4OWoV8O3kFfcOEFI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8TpB0Jy4mzueLrdRHTC3hMxu5AoDgfAVbZhNylymWufMXOr9iO
	WDU9VoCkDu1BmXZlarVnut6cbiNILM0GvsJAWl94uH8CGGvoSFflSozd
X-Gm-Gg: AYBFou22ZR79KKSeLBrtQnzYOYXzMRMYh0QdKTxW3geWKnRdxU+INZtW7agbMP2j19x
	YjyhtTHF6xfZO1xHNDOM11NvW8Z2U+d2eWKScYOGQvI9IdkT0NGFN2qM9ZwyXQREFBOITLFqik1
	an8opeIi2BO93E4UmqVysRu4KNrCycUo5HwIlA3sTVa3DDC/VFYB0LgtIAynXvh3TPa+FMStgtv
	OlV5PdIWDucvwyolTNle+3AjktnyAwd2ciP8HW7yGUrlPaIO/2Fv+GvPQE6wnF2J9kYdWlT0Y3Y
	e3Bht/GWl779tTHyf1w+QGNXHgsrIkjD7pEbj4JrW2ViOYFXTBMwtqbK/JP/ZM0RVJeoCxxHXEu
	IjJl0ZwSvmhDByuOAAYauFvXHknPaQplhbF1swIm/62wdcrR2Hf3RWCVY12WnQI80V/9u5l3hiB
	esw4Rw3Q/hZzv+kQvO+n4VnQyBj/5NdjUCzMFLpB6H8oljnH5qnm7r6vpdzzld3vMO40AxXHUmF
	d+wNp32+pN7tDR0r0UXod4Jal/TUKqjtYJGo+Sx8jLlyj1IupNJvRLGxkZrCxhJIEI7ESbyE+TI
	/CzomFE1nDM3yKwiORkGl9nRKVnJerRXi5Hhuo0XqKDip5soSPLlMmrWJJAwplk+nA==
X-Received: by 2002:a05:7300:3b0c:b0:36a:238:1485 with SMTP id 5a478bee46e88-36a4244276cmr24803721eec.37.1793657120646;
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm42657742eec.7.2026.11.02.14.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:20 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	media-ci@linuxtv.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/6] media: iris: add iris4 specific H265 line buffer calculation
Date: Tue,  3 Nov 2026 07:05:19 +0900
Message-ID: <20261102220519.1738-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261001153221.4FAC61F000FF@smtp.kernel.org>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com> <20261001-kaanapali-iris-v4-3-642f9ac5e699@oss.qualcomm.com> <20261001153221.4FAC61F000FF@smtp.kernel.org>
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

On Thu, 01 Oct 2026 15:32:20 +0000, sashiko-bot@kernel.org wrote:
> > +		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
[...]
> > +	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
> > +		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
[...]
> Does this code multiply dpb_obp by num_vpp_pipes twice?
[...]
> Is this double multiplication intentional, or should one of the
> multipliers be removed to prevent over-allocating the line buffer?

Some data on this from a Lenovo Y700 Gen 5 (TB323FU, Kaanapali), with
this patch on v7.3 and out-of-tree Kaanapali support. Hardware decodes
were compared bit for bit with software decoding:

                             HEVC Main10      HEVC Main
                             1080p   2160p    1080p
  v4 3/6 as is               pass    pass     pass
  dpb_obp multiplied once    fail    fail     pass
  once, OPB lines doubled
  for 10-bit output          pass    pass     pass

The failures are "session error received 0x4000005: insufficient
resources" with no frames decoded.

With num_vpp_pipes = 2, the second multiplication doubles dpb_obp.
That is what 10-bit output needs. With one multiplication, Main10
passes once the size_dpb_opb() part is doubled for a 10-bit capture
format. 8-bit streams pass without that.

Is the second multiplication meant to cover 10-bit output? If not, I
can send the 10-bit sizing as a patch on top of this series.

Thanks,
Joonhoe Kim
