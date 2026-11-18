Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989531;
	b=tAvTmGev/rrkWbAe3M8+0vw6RCABWq9YhUTK5uQPWpucnm5ISE15qXJSfpyTMxGoc9iX
	 A7MX71M2rMLMHOxpSLtUOiG1FEogMpnGbMd/jEHsvbn+mRN53DdnUNngBOBEE14KfsLhk
	 ifJE2NbIbkxHkZpt5zFqcayC8XjqxdtFtRLcCYgg8zVrD7/ZExqtIYseXvR7CDRPC2tdL
	 +61ZBOKOnZuE00m1+oGZAPOzkrb7mE6YIG9cE/M5/2lJLrqqIxiuaYOY7VHfN5vEX7dvq
	 bi5XbSHJhQumaE4xFsUYEHpMVCAOkWpvQ054ji4XYOSQuaqHNcOWbU/1ZD92ocfkrhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989531;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/jA+oDJSVCbC1D4MaARjc1w8poFChMuVZsc8cn6/jQ0=;
	b=Z83pFdj9fXXi/GREaAjuScaj/fXhnEc29cjaq6YTt87T+q7nnocb9axZFXtBis7PDpcc
	 V90Iur/q8RkNT0/d6t2w19qRCTXCfl7y+6pvTXtdfhaNa2S9isJuzr0LjUT6XTDEILRtG
	 NFqm+6PnZSwfgMEf8v8xENjUyYMyzfZkm+HhmgOt656As7Pa1/kftkExOh+RVx5IL/lSO
	 FKBxIw3kbNcfGm/Yz7ZP4ag54Fst1EZuRNwueTbFpub5NvXcX0lGadDuXETCmHv4kGjHC
	 YV9LzMhSDaaMUig0rtlny0tq/c7Z0o4FqOf99cOBnHA8WxC7n/iahkgb/Ng7Dvmx54Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Jski2Vet;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4D3606A32C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Jski2Vet
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D041F000C6;
	Wed, 18 Nov 2026 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794989531;
	bh=/jA+oDJSVCbC1D4MaARjc1w8poFChMuVZsc8cn6/jQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Jski2Vetfb3GPph7EA2pyQWzTuAe3AfpSXVb3sYMOMfmAIp12Tx2RaYWgcJx0DUjh
	 bB/RZzhuHlnf0nxPso1pZ2GuJBFa+bJ25OXtTyStnzkIn3DBXDAtEGfMhy9Cx/dXel
	 u+CREOLcs1EtGTN9F0qbSA32aXVuunQ2U+nWNDBA=
Date: Wed, 18 Nov 2026 00:12:10 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: cxg <evers_chen@163.com>
Cc: sashiko-reviews@lists.linux.dev, david@kernel.org, shuah@kernel.org,
 ljs@kernel.org, linux-mm@kvack.org, Xionggui Chen
 <chenxionggui@lanxincomputing.com>
Subject: Re: [PATCH v2] selftests/mm: handle implicit read permissions in
 madv_populate
Message-Id: <20261118001210.582cf89e7479c9786e726486@linux-foundation.org>
In-Reply-To: <138084c8-e177-42fb-b37d-7e8342ef309c@163.com>
References: <20261112031811.56500-1-evers_chen@163.com>
	<20261117070606.3752-1-evers_chen@163.com>
	<sashiko-outbox-220290@kernel.org>
	<138084c8-e177-42fb-b37d-7e8342ef309c@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 16:03:38 +0800 cxg <evers_chen@163.com> wrote:

> I noticed that the Fixes tag in the patch currently in mm-new points to 
> the original selftest commit.
> 
> Since the test failure was introduced by the RISC-V VMA permission 
> change, the Fixes tag should instead be:
> 
> Fixes: 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to VM_READ | 
> VM_WRITE")
> 
> Could you please update the Fixes tag in mm-new?

No probs.


From: Xionggui Chen <chenxionggui@lanxincomputing.com>
Subject: selftests/mm: handle implicit read permissions in madv_populate
Date: Tue, 17 Nov 2026 07:06:06 +0000

The madv_populate selftest assumes that mmap(PROT_WRITE) creates a VMA
without VM_READ and expects MADV_POPULATE_READ to fail with EINVAL.

On RISC-V, commit 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to
VM_READ | VM_WRITE") makes the kernel set VM_READ for mappings requested
with PROT_WRITE.  MADV_POPULATE_READ checks this VMA permission, so it
succeeds and the test fails incorrectly.

Adjust the expected result for RISC-V using an architecture-specific
conditional, while preserving the existing behavior on other
architectures.

On RISC-V with Linux 7.2.0, the original test fails 1 out of 16 tests,
while the updated test passes all 16 tests.

Link: https://lore.kernel.org/20261117070606.3752-1-evers_chen@163.com
Link: https://lore.kernel.org/20261112031811.56500-1-evers_chen@163.com
Fixes: 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to VM_READ | VM_WRITE")
Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>

 tools/testing/selftests/mm/madv_populate.c |    5 +++++
 1 file changed, 5 insertions(+)

--- a/tools/testing/selftests/mm/madv_populate.c~selftests-mm-handle-implicit-read-permissions-in-madv_populate
+++ a/tools/testing/selftests/mm/madv_populate.c
@@ -81,8 +81,13 @@ static void test_prot_write(void)
 		ksft_exit_fail_msg("mmap failed\n");
 
 	ret = madvise(addr, SIZE, MADV_POPULATE_READ);
+#ifdef __riscv
+	ksft_test_result(ret == 0,
+			 "MADV_POPULATE_READ with PROT_WRITE\n");
+#else
 	ksft_test_result(ret == -1 && errno == EINVAL,
 			 "MADV_POPULATE_READ with PROT_WRITE\n");
+#endif
 
 	ret = madvise(addr, SIZE, MADV_POPULATE_WRITE);
 	ksft_test_result(!ret, "MADV_POPULATE_WRITE with PROT_WRITE\n");
_

